## Coursera, Datascientist Specialization, December 2015
## Capstone Project
## Author: Jeroen Zonneveld
##
## Please view the README.md in this repo to understand the the goal of
## this project.
## Github Repo: https://github.com/jpzonneveld/DSC_Capstone_Project
##

## Continuation from 1_Download_Data.R script.

library(tm)
library(slam)
library(RWeka)
library(stringr)

######################################################################################

## Data cleaning function which creates a cleaned corpus
CleanCorpus <- function(InputSource, profanitylist) {
      clean_text <- VCorpus(VectorSource(InputSource))
      clean_text <- tm_map(clean_text, content_transformer(function(x) 
            iconv(x, to="ASCII", sub = "byte")))
      DeleteSymbol<- function(x) gsub("<..>", "", x)
      clean_text <- tm_map(clean_text, content_transformer(DeleteSymbol))
      clean_text <- tm_map(clean_text, content_transformer(function(x) 
            iconv(x, to="UTF-8", sub = "byte")))
      clean_text <- tm_map(clean_text, stripWhitespace)
      clean_text <- tm_map(clean_text, content_transformer(tolower))
      clean_text <- tm_map(clean_text, removeWords, profanity)
      clean_text <- tm_map(clean_text, content_transformer(removePunctuation))
      clean_text <- tm_map(clean_text, content_transformer(removeNumbers))
      clean_text <- tm_map(clean_text, stripWhitespace)
      clean_text
}

## Creates a DF based on the input corpus.
CorpustoDF <- function(InputSource){
      data.frame(text=unlist(sapply(InputSource,`[`, "content")), 
                 stringsAsFactors = FALSE)
}

## Building the tokenization function for the n-grams
ngramCreate <- function(inputCorpus, n) {
      corpus <- NGramTokenizer(inputCorpus, 
                               Weka_control(min = n, max = n, delimiters = " \\r\\n\\t"))
      corpus <- data.frame(table(corpus))
      corpus <- corpus[order(corpus$Freq, decreasing = TRUE),]
      colnames(corpus) <- c("String","Freq")
      split <- as.data.frame(do.call(rbind, str_split(corpus$String, ' ')))
      corpus <- cbind(split, corpus$Freq)
      corpus
}

## Word Frequency DF function, creates a data frame with the frequency 
## for each word in a corpus.
WordFrequencyDF <- function(InputSource) {
      tdm <- TermDocumentMatrix(InputSource)
      freq <- sort(row_sums(tdm, na.rm=TRUE), decreasing=TRUE)
      word <- names(freq)
      data.frame(word=word, freq=freq)
}


#####################################################################################

## Load profanity word list
## source: https://gist.github.com/jamiew/1112488
profanity <- readLines("../Data/profanityfilter.txt")

# Clean corpus and store as data frames
sample_corpus <- CleanCorpus(sample, profanity)
saveRDS(sample_corpus, file = "../Data_Prep/sample_corpus_clean.RDS")
sampleDF <- CorpustoDF(sample_corpus)
saveRDS(sampleDF, file  = "../Data_Prep/sample_df_clean.RDS")

rm(profanity, sample)

# Convert to ngrams.
Sample_1_gram <- WordFrequencyDF(sample_corpus)
colnames(Sample_1_gram) <- c("Prediction", "Frequency")
saveRDS(Sample_1_gram, file = "./Sample_1_gram.RDS")
rm(sample_corpus)

Sample_2_gram <- ngramCreate(sampleDF, 2)
colnames(Sample_2_gram) <- c("First", "Prediction", "Frequency")
saveRDS(Sample_2_gram, file = "./Sample_2_gram.RDS")

Sample_3_gram <- ngramCreate(sampleDF, 3)
colnames(Sample_3_gram) <- c("First", "Second", "Prediction", "Frequency")
saveRDS(Sample_3_gram, file = "./Sample_3_gram.RDS")

Sample_4_gram <- ngramCreate(sampleDF, 4)
colnames(Sample_4_gram) <- c("First", "Second", "Third", "Prediction", "Frequency")
saveRDS(Sample_4_gram, file = "./Sample_4_gram.RDS")

Sample_5_gram <- ngramCreate(sampleDF, 5)
colnames(Sample_5_gram) <- c("First", "Second", "Third", "Fourth", "Prediction", "Frequency")
saveRDS(Sample_5_gram, file = "./Sample_5_gram.RDS")

# Clean-up
rm(sampleDF)
rm(Sample_1_gram, Sample_2_gram, Sample_3_gram, Sample_4_gram, Sample_5_gram)
rm(CleanCorpus, CorpustoDF, ngramCreate, WordFrequencyDF)

