## Getting and Cleaning Data Course Project

The goal of this project was to creat an R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Motivation

The motivation of this project is to learn how to take raw data and turn it into tidy data that is easy to analyze and understand. 

## Data

The data used for this project is data linked from the course website and represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

## Package Installation

I used the functions of two packages for this project in order to fully implement my script:
1. reshape2
2. data.table

## How to Implement Script

1. Create a Course Project folder in your local directory for clear and efficient access to all data.
2. Download data source to this folder. Downloaded data will be contained in "UCI HAR Data" folder.
3. Load run_analysis.R script into Course Project folder.
4. Running the script will obtain the tidy data set tidy_data.txt.




