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

source("./predictor.R")

shinyServer(function(input, output) {
      
      wordPrediction <- reactive({
            text <- input$text
            clean_text <- inputCleaner(text)
            wordCount <- length(clean_text)
            wordPrediction <- wordPredictor(wordCount,clean_text)})
      output$predictedWord <- renderPrint(wordPrediction())
})