## Coursera, Datascientist Specialization, December 2015
## Capstone Project
## Author: Jeroen Zonneveld
##
## Please view the README.md in this repo to understand the the goal of
## this project.
## Github Repo: https://github.com/jpzonneveld/DSC_Capstone_Project
##

library(ggplot2)
library(wordcloud)

sampleDF <- readRDS(file="../Milestone_Report/sampleDF.RDS")
ggplot(sampleDF, aes(word, freq, fill=dataset)) + 
      geom_bar(stat="identity") + 
      xlab("Word Frequency") +
      ylab("Words") +
      ggtitle("Top 30 Words From Each Dataset") +
      coord_flip()


wordcloud(words=blogsDF$word, 
          freq=blogsDF$freq,
          random.order=FALSE,
          min.freq=100,
          colors=brewer.pal(8, "Dark2"))

#png(filename = "plot1.png", width = 480, height = 480)
#par(mfrow = c(1,1))
# WORDCLOUD
#dev.off()
#message("plot1.png has been created in your working directory")

wordcloud(words=newsDF$word, 
          freq=newsDF$freq,
          random.order=FALSE,
          min.freq=100,
          colors=brewer.pal(8, "Dark2"))

wordcloud(words=twitterDF$word, 
          freq=twitterDF$freq,
          random.order=FALSE,
          min.freq=100,
          colors=brewer.pal(8, "Dark2"))

