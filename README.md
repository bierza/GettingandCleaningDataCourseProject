##Readme file for Getting and Cleaning Data Course Project

### Introduction
Readme descibe how you can run function "run_analysis" from script "run_analysis.R".
Function run_analysis from R script called run_analysis.R that does the following. 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive activity names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

###Recommendation
**This is only recommendation* for running function faster (without downloading zip data file and package data.table)
- Set working directory to place where you download and unzip data for the project (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
- install package data.table.

###Example how to use script
####Simple example
1. Download "run_analysis.R"
2. Load script to your console *source("run_analysis.R")*.
3. Run function run_analysis *run_analysis()*

###Others information
- The script was tested on Mac with OS X 10.9.2.
