---
title: "Next word prediction"
author: "Jeroen Zonneveld"
date: "December 2015"
output: html_document
subtitle: Coursera Data Science Specialization
---

## Introduction
Around the world, people are spending an increasing amount of time on their mobile devices for email, social networking, banking and a whole range of other activities. But typing on mobile devices can be a serious pain. SwiftKey, our corporate partner in this capstone, builds a smart keyboard that makes it easier for people to type on their mobile devices. One cornerstone of their smart keyboard is predictive text models. When someone types: *"I went to the"* the keyboard presents three options for what the next word might be. For example, the three words might be *"gym"*, *"store"*, *"restaurant"*. In this capstone we will work on understanding and building predictive text models like those used by SwiftKey.

This shiny app was created with that intend in mind. You can paste a phrase in the field and the app will produce a prediction for the next word in your sentence. NOte that it does this based on at maximum the last 4 words in your sentence. 

## Training data
For training a huge data set has been made available. This is based on the [HC Corpora](http://www.corpora.heliohost.org/) datasets. The dataset can be downloaded for free from [Coursera](http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip).
The dataset is put together from a larger number of different sources divided over 3 categories:

* Blogs
* News
* Twitter

The dataset available on the coursera website has four different languages. For this project we only focussed on the English datasets (the `en_US` folder).

## Additional information.
This work was part of the data science specialization from the John Hopkins University and was delivered through [Coursera](https://www.coursera.org/specialization/jhudatascience/1).
* The raw source code for all the work done in this capstone including the code for this app can be found on [github](https://github.com/jpzonneveld/DSC_Capstone_Project).
* A short 5 slide presentation on the app and its working can be found on [RPubs](http://rpubs.com/jpzonneveld/DSC_Final_Report).
* The milestone report created during the data exploration phase can also be found on [RPubs](http://rpubs.com/jpzonneveld/DSC_Milestone_Report).