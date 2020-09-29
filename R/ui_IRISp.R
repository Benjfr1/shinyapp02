#' Shiny app server object
#'
#' @importFrom graphics hist
#' @import shiny
#' @import dplyr

library(ggplot2)
library(dplyr)

ui_IRISp <- fluidPage(
                # title of the page
                titlePanel("Iris data set visualization in Shiny"),
                sidebarLayout(
                  sidebarPanel(
                    # Select variable for y-axis
                    selectInput(
                      inputId = "y",
                      label = "y-axis",
                      choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
                      selected = "Sepal.Length"
                    ),

                    # Select variable for x-axis
                    selectInput(
                      inputId = "x",
                      label = "x-axis",
                      choices = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
                      selected = "Sepal.Width"
                    ),

                    # select species to be dynamically displayed in graph, by default all species are selected
                    checkboxGroupInput(
                      inputId = "species",
                      label = "Select Species",
                      choices = c("Iris-setosa", "Iris-versicolor", "Iris-virginica"),
                      selected = c("Iris-setosa", "Iris-versicolor", "Iris-virginica")
                    )
                  ),


                  mainPanel(
                    tags$h3("Scatter Plot"),
                    plotOutput(outputId = "scatterplot"),
                    tags$h2("Data Table"),
                    tableOutput('table')

                  )


                )
)


