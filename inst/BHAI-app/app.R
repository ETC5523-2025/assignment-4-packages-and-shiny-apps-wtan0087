library(shiny)
library(ggplot2)
library(tidyverse)
library(tidyr)
library(plotly)

data("HAI_data", package = "BHAI.AS4")

ui = fluidPage(
  tags$head(tags$style(
    HTML(
      "
      body {
        background-color: #e6f0f5;
      }
      .title-panel {
        background-color: #2c3e50;
        color: #ffffff;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 20px;
      }
      .sidebar .well {
        background-color: #ffffff;
        border-radius: 5px;
      }
      "
    )
  )),

  div(
    class = "title-panel",
    h1("Burden of Healthcare-Associated Infections in Germany (2011)")
  ),

  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "selected_plot",
        label = "Choose a plot to display:",
        choices = c("Deaths & DALYs", "Cases vs Deaths"),
        selected = "Deaths & DALYs"
      ),
      fluidRow(column(
        width = 12,
        checkboxGroupInput(
          inputId = "infections",
          label = "Select infections to display:",
          choices = unique(HAI_data$Infection),
          selected = unique(HAI_data$Infection),
          inline = TRUE
        )
      )),
      tags$div(
        style = "background-color:#e0f7f7; padding:10px; border-radius:5px; margin-bottom:10px;",
        tags$p(
          strong("Deaths:"),
          "Annual attributable deaths due to the infection"
        ),
        tags$p(strong("DALYs:"), "Disability Adjusted Life Years"),
        tags$p(strong("Cases:"), "Annual number of cases")
      ),
      tags$div(
        style = "background-color:#dfeaf2; padding:10px; border-radius:5px; margin-bottom:10px;",
        tags$p(strong("How to interpret the outputs:")),
        tags$p(
          "Deaths & DALYs: Compare the number of deaths and disability adjusted life years across infections."
        ),
        tags$p(
          "Cases vs Deaths: Bubble size represents DALYs where larger bubbles indicate greater burden. High cases with low deaths indicate less fatal infections."
        ),
        tags$p(strong("Key Findings:")),
        tags$p("Germany shows a high HAI attributable burden."),
        tags$p(
          "Pneumonia (HAP) and Surgical Site Infections (SSI) contribute the largest burden."
        ),
        tags$p(
          "Bloodstream infections (BSI), Urinary tract infections (UTI) and Clostridioides difficile infections (CDI) also contribute significantly."
        ),
        tags$p(
          "Targeted hospital interventions, hygiene improvements and infection prevention measures are likely to reduce HAI associated morbidity and mortality."
        )
      )
    ),

    mainPanel(
      plotlyOutput(
        outputId = "selected_plot_output",
        height = "800px",
        width = "800px"
      )
    )
  )
)




server = function(input, output, session) {
  filtered_data = reactive({
    HAI_data |>
      filter(Infection %in% input$infections)
  })

  output$selected_plot_output = renderPlotly({
    df = filtered_data()

    if (input$selected_plot == "Deaths & DALYs") {
      df_long = df |>
        select(Infection, Deaths, DALY) |>
        pivot_longer(
          cols = c(Deaths, DALY),
          names_to = "Metric",
          values_to = "Value"
        )

      p = ggplot(df_long, aes(x = Infection, y = Value, fill = Metric)) +
        geom_col(position = "dodge") +
        theme_minimal(base_size = 14) +
        labs(x = "Infection Type", y = "Per 100,000 population", fill = "Metric") +
        scale_fill_brewer(palette = "Set2")

      ggplotly(p) |> layout(plot_bgcolor = "rgba(0,0,0,0)", paper_bgcolor = "rgba(0,0,0,0)")
    } else {
      p = ggplot(df, aes(
        x = Cases,
        y = Deaths,
        size = DALY,
        label = Infection
      )) +
        geom_point(color = "steelblue") +
        geom_text(size = 5) +
        theme_minimal(base_size = 14) +
        scale_x_continuous(limits = c(0, 250000)) +
        scale_y_continuous(limits = c(0, 5000)) +
        scale_size_continuous(range = c(3, 25)) +
        labs(x = "Annual Cases", y = "Attributable Deaths", size = "DALYs") +
        theme(legend.position = "none")

      ggplotly(p) |> layout(plot_bgcolor = "rgba(0,0,0,0)", paper_bgcolor = "rgba(0,0,0,0)")
    }
  })
}

shinyApp(ui, server)
