## Coursera, Datascientist Specialization, December 2015
## Capstone Project
## Author: Jeroen Zonneveld
##
## Please view the README.md in this repo to understand the the goal of
## this project.
## Github Repo: https://github.com/jpzonneveld/DSC_Capstone_Project
##

## If you don't have the data sets loaded, execute the following line of code.
## Note: ensure the final lines of this script do not remove the loaded dataset.
#--! source("./Milestone_Report/1_Download_Data.R")

## Checking the size, number of lines and the word count for the files
blogs_size <- file.info("./Data/final/en_US/en_US.blogs.txt")$size 
news_size <- file.info("./Data/final/en_US/en_US.news.txt")$size
twitter_size <- file.info("./Data/final/en_US/en_US.twitter.txt")$size
sample_size <- file.info("./Data/en_US.sample.txt")$size

## Create a data summary
data_summary <- data.frame(
      fileName = c("Blogs","News","Twitter", "Aggregated Sample"),
      fileSize = c(round(blogs_size / (1024^2), digits = 2), 
                   round(news_size / (1024^2), digits = 2), 
                   round(twitter_size / (1024^2), digits = 2),
                   round(sample_size / (1024^2), digits = 2)),
      lineCount = c(length(blogs),
                    length(news),
                    length(twitter),
                    length(sample)),
      wordCount = c(sum(sapply(gregexpr("\\S+", blogs), length)),
                    sum(sapply(gregexpr("\\S+", news), length)),
                    sum(sapply(gregexpr("\\S+", twitter), length)),
                    sum(sapply(gregexpr("\\S+", sample), length)))                  
)
colnames(data_summary) <- c("File Name", "File Size (in MB)", "Line Count", "Word Count")

## Save the summary
saveRDS(data_summary, file = "./Milestone_Report/Data_Summary.Rda")

## Clean-up
rm(blogs_size, news_size, twitter_size, sample_size)
## Further analysis will only be done on the sample data
rm(blogs, news, twitter)
## If creating the data summary was the only goal, execute the following 2 lines as well
#--! rm(sample)
#--! rm(data_summary)
