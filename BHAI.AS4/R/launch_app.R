#' Launch the BHAI.AS4 Shiny App
#'
#' This function launches the interactive BHAI Shiny application included with the BHAI.AS4 package.
#' The app allows exploration of HAI data (cases, deaths, DALYs) with interactive plots.
#'
#' @export
launch_app = function() {
  app_dir = system.file("BHAI-app", package = "BHAI.AS4")
  shiny::runApp(app_dir, display.mode = "normal")
}
