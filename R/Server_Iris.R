#' Shiny app server function
#'
#' @param input provided by shiny
#' @param output provided by shiny
#' @import ggplot2
#' @import dplyr

library(ggplot2)
library(dplyr)
Server_Iris <- function(input, output) {
  # create a reactive dataframe to help with visualization
  df <- reactive({
    iris %>%
      filter(Species %in% input$species)
  })

  # table of summary data
  output$table <- renderTable(iris_summary)

  # scatter plot of species data
  output$scatterplot <- renderPlot({
    ggplot(
      df(),
      aes_string(x = input$x, y = input$y)) +
      geom_point(aes(col = df()$Species), size=3) + scale_color_discrete(name ="Species") +
      geom_smooth(aes(group=df()$Species, color = df()$Species), method='lm')

  })


}


