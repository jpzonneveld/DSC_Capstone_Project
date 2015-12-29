## Coursera, Datascientist Specialization, December 2015
## Capstone Project
## Author: Jeroen Zonneveld
##
## Please view the README.md in this repo to understand the the goal of
## this project.
## Github Repo: https://github.com/jpzonneveld/DSC_Capstone_Project
##


## Downloading and unpacking the dataset
fileURL <- "http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
download.file(fileURL, destfile = "./Data/Dataset.zip")
unlink(fileURL)
unzip("./Data/Dataset.zip", exdir = "Data")

## Loading the data
blogs <- readLines("./Data/final/en_US/en_US.blogs.txt", encoding ="UTF-8", skipNul = TRUE)
news <- readLines("./Data/final/en_US/en_US.news.txt", encoding ="UTF-8", skipNul = TRUE)
twitter <- readLines("./Data/final/en_US/en_US.twitter.txt", encoding ="UTF-8", skipNul = TRUE)

## Sampling the data
set.seed(1910)
blogs_sample <- blogs[sample(1:length(blogs), 10000)]
news_sample <- news[sample(1:length(news), 10000)]
twitter_sample <- twitter[sample(1:length(twitter), 10000)]
sample <- c(blogs_sample, news_sample, twitter_sample)

## Save sample & clean up
writeLines(sample, "./Data/en_US.sample.txt")
rm(fileURL)
rm(blogs_sample, news_sample, twitter_sample)

## If the sample data was the only required output, execute the following 2 lines as well
#--! rm(blogs, news, twitter)
#--! rm(sample)
