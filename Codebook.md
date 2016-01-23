# Coursera Data Science Capstone Codebook

### About:
Author: Jeroen Zonneveld  
Date: December 2015

## Codebook
This work has been created in two parts.

* **The milestone report** - Initial exploration and cleaning of the data. First pass at creating a model to predict the next word of a given string.
* **The shiny app** - A functional data product that lets users input a number of words after which the application will predict the next word in the sentence.
   
In order to reproduce this work, go through the following steps.

### Milestone report
The milestone report requires the following input data to be present in the Milestone_Report folder:
* Data_Summary.RDS
* sampleDF.RDS

In order to create the report with the required RDS files execute the following scripts in order:
* 1_Download_Data.R
* 2_Data_Summary.R - Creates the Data_Summary.RDS file
* 3_Data_Cleaning.R
* 4_Data_Exploration.R - Creates the sampleDF.RDS file
* Milestone_Report.Rmd

**Note** that some of the variables may not cary over from one script to the next. Read the comments and scripts before executing them. 


### Shiny app
In order to create the cleaned up data sets for the shiny app, execute the following scripts in the Data_Prep folder in order:
* 0_Install_Packages.R
* 1_Download_Data.R
* 2_Data_Cleaning.R - Creates the Sample_x_gram.RDS files.

**Note** that some of the variables may not cary over from one script to the next. Read the comments and scripts before executing them. 

The shiny app requires the following files to present in the Shiny_App folder to work properly:
* predictor.R
* server.R
* ui.R
* ./Data/Data_2_gram.RDS
* ./Data/Data_3_gram.RDS
* ./Data/Data_4_gram.RDS
* ./Data/Data_5_gram.RDS
* ./About/about.md

Please note the files created in the Data_prep fase (Sample_x_gram.RDS) can be used as input files for the Shiny app and placed in the Data folder. (Note the renaming to Data_x_gram.RDS)

