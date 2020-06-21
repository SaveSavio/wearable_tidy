---
title: "README"
author: "JCP"
date: "6/20/2020"
output: html_document
---


# wearable_tidy


Get Samsung Galaxy S data and tidy it up.

get_proj_data.R is a script which will retrieve the project data .zip file to the current working directory, then unzip it, leaving a folder named "UCI HAR Dataset" containing the data needed for the main script.

run_analysis.R is the main script for this project.  Here are the instructions:

>You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

If you run the script run_analysis.R with the project data in the working directory, it will complete all of these steps.  It will leave a data frame in the environment named 'mymsdata_avgvals' and will also write this dataset out to a file in the working directory named "m_s_data_avgs.txt".

## CodeBook

See CodeBook.Rmd for a full description of the data set.
