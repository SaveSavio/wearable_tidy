# wearable_tidy
Get Samsung Galaxy S data and tidy it up.

get_proj_data.R is a script containing the function get_proj_data() which will retrieve the project data .zip file to the current working directory, then unzip it, leaving a folder named "UCI HAR Dataset" containing the data needed for the main script.

run_analysis.R is the main script for this project.  Here are the instructions:

You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.