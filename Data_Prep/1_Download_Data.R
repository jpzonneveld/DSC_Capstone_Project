## Coursera, Datascientist Specialization, December 2015
## Capstone Project
## Author: Jeroen Zonneveld
##
## Please view the README.md in this repo to understand the the goal of
## this project.
## Github Repo: https://github.com/jpzonneveld/DSC_Capstone_Project
##

## Continuation from 0_Install_Packages.R script.

## Downloading and unpacking the dataset
if (!file.exists("../Data/Dataset.zip")){
      fileURL <- "http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
      download.file(fileURL, destfile = "../Data/Dataset.zip")
      unlink(fileURL)
      rm(fileURL)
      unzip("../Data/Dataset.zip", exdir = "Data")
}

## Loading the data
blogs <- readLines("../Data/final/en_US/en_US.blogs.txt", encoding ="UTF-8", skipNul = TRUE)
news <- readLines("../Data/final/en_US/en_US.news.txt", encoding ="UTF-8", skipNul = TRUE)
twitter <- readLines("../Data/final/en_US/en_US.twitter.txt", encoding ="UTF-8", skipNul = TRUE)

## Sampling the data (1% of the total data avaialable)
set.seed(1910)
#blogs_sample <- blogs[sample(1:length(blogs), 100)]
#news_sample <- news[sample(1:length(news), 100)]
#twitter_sample <- twitter[sample(1:length(twitter), 100)]
blogs_sample <- blogs[sample(1:length(blogs), 0.01*length(blogs))]
news_sample <- news[sample(1:length(news), 0.01*length(news))]
twitter_sample <- twitter[sample(1:length(twitter), 0.01*length(twitter))]
sample <- c(blogs_sample, news_sample, twitter_sample)
saveRDS(sample, file = "../Data_Prep/sample_raw.RDS")

## Save sample & clean up
rm(blogs, news, twitter)
rm(blogs_sample, news_sample, twitter_sample)

## Continue with the 2_Data_Cleaning.R script.
