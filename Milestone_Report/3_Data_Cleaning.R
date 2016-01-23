## Coursera, Datascientist Specialization, December 2015
## Capstone Project
## Author: Jeroen Zonneveld
##
## Please view the README.md in this repo to understand the the goal of
## this project.
## Github Repo: https://github.com/jpzonneveld/DSC_Capstone_Project
##

library(tm)
library(slam)

######################################################################################

## Data cleaning function which creates a cleaned corpus
CleanCorpus <- function(InputSource, profanitylist) {
      clean_text <- VCorpus(VectorSource(InputSource))
      clean_text <- tm_map(clean_text, content_transformer(function(x) 
            iconv(x, to="ASCII", sub = "byte")))
      DeleteSymbol<- function(x) gsub("<..>", " ", x)
      clean_text <- tm_map(clean_text, content_transformer(DeleteSymbol))
      clean_text <- tm_map(clean_text, content_transformer(function(x) 
            iconv(x, to="UTF-8", sub = "byte")))
      clean_text <- tm_map(clean_text, stripWhitespace)
      clean_text <- tm_map(clean_text, content_transformer(tolower))
#      clean_text <- tm_map(clean_text, removeWords, stopwords("english"))
      clean_text <- tm_map(clean_text, removeWords, profanity)
      clean_text <- tm_map(clean_text, content_transformer(removePunctuation))
      clean_text <- tm_map(clean_text, content_transformer(removeNumbers))
      clean_text <- tm_map(clean_text, stripWhitespace)
#      clean_text <- tm_map(clean_text, stemDocument)
      clean_text
}

## Creates a DF based on the input corpus.
CorpustoDF <- function(InputSource){
      data.frame(text=unlist(sapply(InputSource,`[`, "content")), 
                 stringsAsFactors = FALSE)
}

## Word Frequency DF function, creates a data frame with the frequency 
## for a corpus.
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
blogs_corpus <- CleanCorpus(blogs_sample, profanity)
news_corpus <- CleanCorpus(news_sample, profanity)
twitter_corpus <- CleanCorpus(twitter_sample, profanity)

blogsDF <- CorpustoDF(blogs_corpus)
newsDF <- CorpustoDF(news_corpus)
twitterDF <- CorpustoDF(twitter_corpus)

saveRDS(blogsDF, file = "../Data/blogs_sample.clean.RDS")
saveRDS(newsDF, file = "../Data/news_sample.clean.RDS")
saveRDS(twitterDF, file = "../Data/twitter_sample.clean.RDS")

# write.table(newsDF, file = "../Data/en_US.news.clean.txt", row.names = FALSE, 
#                                   col.names = FALSE, quote=FALSE)


# Count number of appearances per word, store in a DF.
blogs_word <- WordFrequencyDF(blogs_corpus)
news_word <- WordFrequencyDF(news_corpus)
twitter_word <- WordFrequencyDF(twitter_corpus)

blogs_word$dataset <- as.factor("blogs")
news_word$dataset <- as.factor("news")
twitter_word$dataset <- as.factor("twitter")
word_freq <- rbind(blogs_word, news_word, twitter_word)
saveRDS(word_freq, file = "../Milestone_Report/word_freq.RDS")

# Clean-up
rm(word_freq, blogs_corpus, news_corpus, twitter_corpus, profanity)
rm(CleanCorpus, CorpustoDF, WordFrequencyDF)
# If creating a clean corpus was the intended goal, also execute the following lines:
# rm(blogs_sample, news_sample, twitter_sample)
# rm(blogsDF, newsDF, twitterDF)
# when not continuing with the data visualization, also execute the following lines:
# rm(blogs_word, news_word, twitter_word)