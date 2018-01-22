# Getting and Cleanning Data

----
### This project will create a tidy table data with the average of each variable for each activity and each subject. from the Human Activity Recognition \(UCI HAR\) Using Smartphones Dataset.

### Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.

----
## Getting Started

----
### These instructions will get you a copy of the project up and running on your local machine for development and testing purposes

----
## Prerequisites

----
- R package readr 
-- \(can be downloaded with the command: install.packages("readr") \)
- R package dplyr
-- \(can be downloaded with the command: install.packages("dplyr") \)

----
## Running the Test

----
1. Download the UCI HAR Dataset and save it in a local folder: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip de file downloaded
3. Save run_analysis.R from this project in the same folder as the Dataset
4. Set the folder as the working directory in R with the command: setwd() 
5. Run source("run_analysis.R"), which will generate a new file tiny_data.txt in your working directory.
