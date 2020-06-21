---
title: "CodeBook"
author: "JCP"
date: "6/20/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# CodeBook

This document describes the variables and data in my dataset as well as the cleanup work that I did.

## Source

The original source of this data is the University of California Irvine Machine Learning Repository at <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data used for this project, however, was acquired from this link: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


## Description

The data is from a study where 30 subjects (labeled as 1:30) did a variety of six activities while wearing a Samsung Galaxy S smartphone on their waist.  The phone's gyroscope and accelerometer recorded measurements of linear acceleration and angular velocity at a sample rate of 50Hz.  The original data set contained 561 features of these measurements.  70% of the subjects' data was in a training data set and 30% was in a test data set.

The Activities were labeled with numbers 1:6 as follows

```{r , echo=FALSE}
myacts<-read.table("UCI HAR Dataset/activity_labels.txt")
myacts
```

## Transformation

The first data set provided is a result of the following cleanup actions:

1. Read in descriptive feature (variable) names from features.text and activity labels from activity_labels.txt
2. Read in the test data.
    a. Read in the test data set using the feature names as descriptive column names.
    b. Read in the test activity labels, convert them to activity names, and join them to the test data.
    c. Read in the test subject labels and join them to the test data.
3. Read in the train data.
    a. Read in the train data set using the feature names as descriptive column names.
    b. Read in the train activity labels, convert them to activity names, and join them to the train data.
    c. Read in the train subject labels and join them to the train data.
4. Combine test and train into one data set.
5. Extract only the measurement means and standard deviations.
6. Summarize the data set from step 5 with only the average value of all the measurements for each activity and subject.
    a. Use nested for loops to filter the data by each activity (1:6) and each subject (1:30).
    b. Use colMeans to get the averages of each column of this filtered subset.
    c. Write that to a new table which will end up with 180 (6 x 30) rows, one for each subject * activity.
7. Write this data out to a file m_s_data_avgs.txt

## Data set

The tidy data set produced by the script has the following variables:

Subject : A number (1:30) representing the subject whose data is summarised on that row

Activity: One of (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) indicating which Activity is represented in that row.

The remaining variables are as described in the codebook for the original dataset.  Only the features identified as a mean or standard deviation are included (see Step 5 in the Transformation section above), and the value listed for each row is the average of all values of that measurement for that particular Activity * Subject combination.  Since there are 30 Subjects and six Activities, there are 180 rows in this data set.

Below is the output of the command head(mymsdata_avgvals)

```{r , echo=FALSE}
mymsdata_avgvals<-read.table("m_s_data_avgs.txt", header = TRUE)
head(mymsdata_avgvals)
```




