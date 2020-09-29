#' launches the shinyAppDemo app
#'
#' @export run_app_iris
#'
#' @return shiny application object
#'
#' @example \dontrun {launchApp()}
#'
#' @import shiny
#'

run_app_iris <- function(options = list()) {
  shiny::shinyApp(ui = ui_IRISp,
                  server = Server_Iris,
                  options = options)
}
