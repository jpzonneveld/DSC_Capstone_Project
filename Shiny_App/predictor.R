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

Data_2_gram <- readRDS(file="./Data/Data_2_gram.RDS")
Data_3_gram <- readRDS(file="./Data/Data_3_gram.RDS")
Data_4_gram <- readRDS(file="./Data/Data_4_gram.RDS")
Data_5_gram <- readRDS(file="./Data/Data_5_gram.RDS")

dataCleaner <- function(text){
      clean_text <- removePunctuation(text)
      clean_text <- tolower(clean_text)
      clean_text <- removeNumbers(clean_text)
      clean_text <- stripWhitespace(clean_text)
      
      return(clean_text)
}

inputCleaner <- function(text) {
      
      clean_text <- dataCleaner(text)
      clean_text <- txt.to.words.ext(clean_text, language="English.all", 
                                    preserve.case = TRUE)
      return(clean_text)
}

wordPredictor <- function(wordCount, clean_text){

      if (wordCount>=4) {
            clean_text <- clean_text[(wordCount-3):wordCount]
      }
      else if(wordCount==3) {clean_text <- c(NA,clean_text)}
      else if(wordCount==2) {clean_text <- c(NA,NA,clean_text)}
      else {clean_text <- c(NA,NA,NA,clean_text)}
      
      wordPrediction <- as.character(Data_5_gram[Data_5_gram$First==clean_text[1] & 
                                                      Data_5_gram$Second==clean_text[2] & 
                                                      Data_5_gram$Third==clean_text[3] &
                                                      Data_5_gram$Fourth==clean_text[4],][1,]$Prediction)
      
      if(is.na(wordPrediction)) {
            wordPrediction <- as.character(Data_4_gram[Data_4_gram$First==clean_text[2] & 
                                                             Data_4_gram$Second==clean_text[3] & 
                                                             Data_4_gram$Third==clean_text[4],][1,]$Prediction)
            
            if(is.na(wordPrediction)) {
                  wordPrediction <- as.character(Data_3_gram[Data_3_gram$First==clean_text[3] & 
                                                                   Data_3_gram$Second==clean_text[4],][1,]$Prediction)
                  
                  if(is.na(wordPrediction)) {
                        wordPrediction <- as.character(Data_2_gram[Data_2_gram$First==clean_text[4],][1,]$Prediction)
                        
                        if(is.na(wordPrediction)) {
                              wordPrediction <- as.character(c("the"))
                        }
                  }
            }
      }
 
      print(wordPrediction)
      
}