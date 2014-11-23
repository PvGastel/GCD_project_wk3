# Scriptname run_analysis:
#
# Project assigment week 3 Getting and Cleaning Data
#
# Goal:
# create one R script called run_analysis.R that does the following. 
#  1 Merges the training and the test sets to create one data set.
#  2 Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3 Uses descriptive activity names to name the activities in the data set
#  4 Appropriately labels the data set with descriptive variable names. 
#  5 From the data set in step 4, create a second, independent tidy data set with the average of each variable for 
#    each activity and each subject.
#

# Set workingdirectory 
setwd("./GCD project wk3/")


# read files with columnames and labels in R
Features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
Activity <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)


# read test files in R
TestSubjects <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
TestMeasure <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
TestActivity <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)


# read training files in R
TrainSubjects <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
TrainMeasure <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
TrainActivity <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)


# set activity names to lowercase
Activity[,2] <- tolower(Activity[,2])


# Add activity names in test and training to activities
TestActivity[,"activity_name"] <- as.factor(Activity[(TestActivity[,1]),2]) 
TrainActivity[,"activity_name"] <- as.factor(Activity[(TrainActivity[,1]),2]) 


# Solving non-permitted characters in columnames features.txt
# , -> . (dot)
# - -> _ (underscore) 
# () -> "" (nothing)
# ( -> _ (underscore)
# ) -> "" (nothing)
# Changing mean to Mean and std to StdDev
# Adding more meaningfull name to t and f at the beginning
Features[,2] <- gsub(",", ".", Features[,2])
Features[,2] <- gsub("-mean", "Mean", Features[,2])
Features[,2] <- gsub("-std", "StdDev", Features[,2])
Features[,2] <- gsub("BodyBody", "Body", Features[,2])
Features[,2] <- gsub("\\(\\)", "", Features[,2])
Features[,2] <- gsub("[-(]", "_", Features[,2])
Features[,2] <- gsub("\\)", "", Features[,2])
Features[,2] <- gsub("^t", "Time", Features[,2])
Features[,2] <- gsub("^f", "Frequency", Features[,2])


# Merge Testing and Training files
TestingSet <- cbind(TestSubjects, TestActivity, TestMeasure)
TrainingSet <- cbind(TrainSubjects, TrainActivity, TrainMeasure)
# TrainingSet <- cbind(TrainSubjects, TrainActivity[,2], TrainMeasure)

# Merge test and trainingfiles to one data set
TotalDataSet <- rbind(TestingSet, TrainingSet)


# Add columnames to files
colnames(TotalDataSet) <- c("Subject", "Act_nr", "Activity", Features[,2])


# Extract only the measurements on the mean and standard deviation for each measurement
TotalDataSet$Act_nr <- as.factor(TotalDataSet$Act_nr)
TotalDataSet$Subject <- as.factor(TotalDataSet$Subject)

ColNames <- names(TotalDataSet)
ColIndex <- c(1,3, grep(".*Mean.*|.*Std.*", ColNames))
CleanTidySet <- TotalDataSet[,ColIndex]


# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
# load library plyr
library(plyr)
# Column means for all colums except subject and activity
GroupedColMeans <- function(data) { colMeans(data[,-c(1,2)]) }
SecondTidy <- ddply(CleanTidySet, .(Subject, Activity), GroupedColMeans)

# add Mean_ to columnames 
names(SecondTidy)[-c(1,2)] <- paste0("Mean_", names(SecondTidy)[-c(1,2)])

# Write file
write.table(SecondTidy, "SecondTidy.txt", sep="\t", row.names = FALSE)
