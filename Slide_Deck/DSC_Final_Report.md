DATA SCIENCE CAPSTONE PROJECT
========================================================
author: Jeroen Zonneveld
date: December 2015
transition: rotate

A Shiny Application for the Coursera Data Science Capstone. 


GOAL
========================================================
type: sub-section

This presentation is part of the capstone project for the Coursera Data Science Specialization.

In this presentation we will look at predicting the next word in a given sentence. To explore this practically we created a new Shiny Application. The application can be found [here](https://jpzonneveld.shinyapps.io/DSC_Capstone/).

After this presentation you should have a good understanding of the application and its working.

TRAINING DATA
========================================================
For training the model a sample of the the [HC Corpora](http://www.corpora.heliohost.org/) datasets was used.
The sample was cleaned by removing punctuation, white spaces, numbers and special characters.
This data sample was then [tokenized](http://en.wikipedia.org/wiki/Tokenization_%28lexical_analysis%29) into so-called [*n*-grams](http://en.wikipedia.org/wiki/N-gram). 

This basically means a table is created which counts how often each string of *n* words turns up in the data. Below is a sample of the 4-gram data.


```
  First Second Third Prediction Frequency
1   the    end    of        the        46
2    at    the   end         of        45
3    is  going    to         be        43
```

USING THE APPLICATION
========================================================

The application uses the 2-gram, 3-gram, 4-gram and 5-gram datasets that were obtained from the traingin data. After a user enters a (part of) a sentence, the application takes  the last 4 words that were entered and looks them up in the 5-gram dataset. If there is a match, the word in the "prediction" column is shown. 

If there is no match, the applicatoin looks at the last 3 words that were entered and looks them up in the 4-gram dataset, and so on. 
If no match was found in any of the n-gram datasets, the most used word in the trainingsets is proposed (*"the"*).

The applicaiton is responsive to input so it will recalculate the answer after a change was made by the user of the application.


MORE INFORMATION
========================================================

* The app is hosted on [shinyapps.io](https://jpzonneveld.shinyapps.io/DSC_Capstone/).

* All code for this application, as well as the milestone report, related scripts and this presentation can be found on [Github](https://github.com/jpzonneveld/DSC_Capstone_Project).

* This pitch deck is hosted on [Rpubs](http://rpubs.com/jpzonneveld/DSC_Final_Report)

* The raw data from the [HC Corpora](http://www.corpora.heliohost.org/) can be downloaded for free from [Coursera](http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip).

* Learn more about the [Coursera Data Science Specialization](https://www.coursera.org/specialization/jhudatascience/1).
