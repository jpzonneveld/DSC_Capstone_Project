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

## Data cleaning function which creates a data frame with cleaned corpus
createDF <- function(InputSource, profanitylist) {
      clean_text <- VCorpus(VectorSource(InputSource))
      clean_text <- tm_map(clean_text, content_transformer(function(x) iconv(x, to="UTF-8", sub="byte")))
      clean_text <- tm_map(clean_text, stripWhitespace)
      clean_text <- tm_map(clean_text, content_transformer(tolower))
      clean_text <- tm_map(clean_text, removeWords, stopwords("english"))
      clean_text <- tm_map(clean_text, removeWords, profanity)
      clean_text <- tm_map(clean_text, stemDocument)
      clean_text <- tm_map(clean_text, content_transformer(removePunctuation))
      clean_text <- tm_map(clean_text, content_transformer(removeNumbers))

      tdm <- TermDocumentMatrix(clean_text)
      freq <- sort(row_sums(tdm, na.rm=TRUE), decreasing=TRUE)
      word <- names(freq)
      data.frame(word=word, freq=freq)
}

## Load profanity word list
## source: https://gist.github.com/jamiew/1112488
profanity <- readLines("../Data/profanityfilter.txt")

# Process vectors into dataframe of word counts
blogsDF <- createDF(blogs_sample, profanity)
newsDF <- createDF(news_sample, profanity)
twitterDF <- createDF(twitter_sample, profanity)

# Stack them all together
blogsDF$dataset <- as.factor("blogs")
newsDF$dataset <- as.factor("news")
twitterDF$dataset <- as.factor("twitter")
combinedDF <- rbind(blogsDF, newsDF, twitterDF)

saveRDS(blogsDF, file = "../Data/en_US.blogs.clean.RDS")
saveRDS(newsDF, file = "../Data/en_US.news.clean.RDS")
saveRDS(twitterDF, file = "../Data/en_US.twitter.clean.RDS")
saveRDS(combinedDF, file = "../Data/en_US.combined.clean.RDS")

sampleDF <- rbind(blogsDF[1:30, ], newsDF[1:30, ], twitterDF[1:30, ])
sampleDF_Aggregate <- aggregate(. ~ word, sampleDF[, 1:2], sum)
sampleDF <- merge(sampleDF, sampleDF_Aggregate, by="word")
names(sampleDF)[2] <- "freq"
sampleDF$word <- reorder(sampleDF$word, sampleDF$freq.y)

saveRDS(sampleDF, file = "../Milestone_Report/sampleDF.RDS")
