## Coursera, Datascientist Specialization, December 2015
## Capstone Project
## Author: Jeroen Zonneveld
##
## Please view the README.md in this repo to understand the the goal of
## this project.
## Github Repo: https://github.com/jpzonneveld/DSC_Capstone_Project
##

library(tm)
library(SnowballC)

## If the sample data is not loaded; execute the following line of code
#--! sample <- readLines("./Data/en_US.sample.txt", encoding ="UTF-8", skipNul = TRUE)

## Load profanity word list
## source: https://gist.github.com/jamiew/1112488
profanity <- readLines("./Data/profanityfilter.txt")

## Build the corpus
sample_clean <- Corpus(VectorSource(sample))
#--! rm(sample)
sample_clean <- tm_map(sample_clean, content_transformer(
                                          function(x)
                                              iconv(x, to = "UTF-8", sub="byte")        
                                          ))

## Convert all characters to lower case.
sample_clean <- tm_map(sample_clean, content_transformer(tolower), lazy = TRUE)

## Remove punctuation, numbers, URLs, whitespaces, stopwords and profanity words. 
sample_clean <- tm_map(sample_clean, content_transformer(removePunctuation))
sample_clean <- tm_map(sample_clean, content_transformer(removeNumbers))
sample_clean <- tm_map(sample_clean, content_transformer(
                                          function(x)
                                                gsub("http[[:alnum:]]*", "", x)
                                          ))
sample_clean <- tm_map(sample_clean, stripWhitespace)
sample_clean <- tm_map(sample_clean, removeWords, stopwords("english"))
sample_clean <- tm_map(sample_clean, removeWords, profanity)

## Bring the words back to their stem using Porter's stemming algorithm
#--!sample_clean <- tm_map(sample_clean, stemDocument)
#--!sample_clean <- tm_map(sample_clean, stripWhitespace)

## Saving the final corpus
saveRDS(sample_clean, file = "./Data/en_US.sample.clean.RDS")
sample_clean <-data.frame(text=unlist(sapply(sample_clean,`[`, "content")), 
                              stringsAsFactors = FALSE)

## Clean-up
rm(profanity)
## If creating the clean corpus data file was the only goal, execute the following line as well
#--! rm(sample_clean)