# GCD_project_wk3
===============

## Project assignment Getting and Cleaning Data week 3

### Preparation:
 read assigment
 downloading zipfile from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 unzipping file and directories in directory ./GCD project wk3
 looking at structure directories and files
 read readme.txt
 read features_info.txt

Implementation in R:
create one R script called run_analysis.R

Read files with columnames and labels in R
     Features <- features.txt
     Activity <- activity_labels.txt
     
Read test files in R
     TestSubjects <- subject_test.txt
     TestMeasure <- X_test.txt
     TestActivity <- y_test.txt

Read training files in R
     TrainSubjects <- subject_train.txt
     TrainMeasure <- X_train.txt
     TrainActivity <- y_train.txt

View files with: view(), head(), etc

Determine strategy for cleaning and tidying
    Set activity names to lowercase
    Add activity names to activities
    Solving non-permitted characters in columnames features.txt
    Changing mean to Mean and std to StdDev
    Adding more meaningfull names to t and f at the beginning
    Merge test and trainingfiles to one data set
    Adding columnames to file

Extract only the measurements on the mean and standard deviation for each measurement
    Select colums with grep(".*Mean.*|.*Std.*", ColNames)
    Compute means for all colums except subject and activity

Create a second, independent tidy data set with the average of each variable for each activity and each subject.
    load library plyr
    Add Mean_ to columnames
    Write file

Push files in GitHub
