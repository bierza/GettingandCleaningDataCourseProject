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
**This is only recommendation** for running function faster (without downloading zip data file and package data.table)
- Set working directory to place where you download and unzip data for the project (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
- In the working directory you can find those files and folders: features.txt, activity_labels.txt, test and train.
- Install package data.table.

###Example how to use script
####Simple example
1. Download "run_analysis.R" to working directory of R console.
2. Load script to your console *source("run_analysis.R")*.
3. Run function run_analysis *data<-run_analysis()*

**What happens:**
- run_analysis() put tidy data set with the average of each variable for each activity and each subject to variable data.

####Complete example
1. Download "run_analysis.R"
2. Load script to your console *source("run_analysis.R")*.
3. Run function run_analysis *data<-run_analysis(sour_dir="./loaddata/",dest_dir="./savedata/",save_to_file=T)*

**What happens:**
- load data from directory "./loaddata/"
- function run_analysis put tidy data set with the average of each variable for each activity and each subject to variable data.
- save comlete merge data to file "./savedata/comletedata.txt"
- save data set with the average of each variable for each activity and each subject to file "./savedata/finaldata.txt"


###Others information
- The script was tested on Mac with OS X 10.9.2.
- Windows could have problem with diffrent path system (Windows "C:\data\R\" Mac "./data/R/"). Script download data file in this case.
- When data.table package isn`t instaled than script would install data.table package.
- When script didn`t find data for load than script would download zip file to temporary value.
