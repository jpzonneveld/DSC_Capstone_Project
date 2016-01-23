## Coursera, Datascientist Specialization, December 2015
## Capstone Project
## Author: Jeroen Zonneveld
##
## Please view the README.md in this repo to understand the the goal of
## this project.
## Github Repo: https://github.com/jpzonneveld/DSC_Capstone_Project
##

suppressPackageStartupMessages(c(
      library(shinythemes),
      library(shiny),
      library(tm),
      library(stringr),
      library(markdown),
      library(stylo)))

shinyUI(navbarPage("Coursera Data Science Capstone", 
      theme = shinytheme("flatly"),
                   
## Tab 1 - Prediction
      tabPanel("Predict next word",
            fluidRow(
                  column(3),
                  column(6,
                        tags$div(textInput("text", 
                              label = h3("Enter your text here:"),
                              value = ),
                        tags$span(style="color:grey",("Only English words are supported.")),
                        br(),
                        tags$hr(),
                        h4("The predicted next word:"),
                        tags$span(style="color:darkred",
                              tags$strong(tags$h3(textOutput("predictedWord")))),
                        align="center")
                  ),
                  column(3)
            )
      ),
                   
## Tab 2 - About 
                   
      tabPanel("About this app",
            fluidRow(
                  column(2, p("")),
                  column(8, includeMarkdown("./About/about.md")),
                  column(2, p(""))
            )
      )
))             
                   