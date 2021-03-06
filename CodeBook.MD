## CodeBook

### Human Activity Recognition Using Smartphones Data Set 
Data Set Characteristics:  Multivariate, Time-Series
Number of Instances:       10299
Area:			   Computer
Attribute Characteristics: N/A
Number of Attributes: 	   561
Date Donated: 		   2012-12-10
Associated Tasks: 	   Classification, Clustering
Missing Values? 	   N/A
Number of Web Hits: 	   128754



### Source:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 


### Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


### The dataset includes the following files:
=========================================
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


### Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


### Attribute Information:
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


### Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


### Contents SecondTidy file for project assignment GCD week 3

The R script called run_analysis.R did the following. 
  1 Merges the training and the test sets to create one data set.
  2 Extracts only the measurements on the mean and standard deviation for each measurement. 
  3 Uses descriptive activity names to name the activities in the data set
  4 Appropriately labels the data set with descriptive variable names. 
  5 From the data set in step 4, created a second, independent tidy data set with the average of each variable for 
    each activity and each subject.

For further explanation see comments in the R-script

#### The SecondTidy file contains the following attributes

Subject   (subjectnumber, 1-30 volunteers)
Activity  (activity name)
Mean_TimeBodyAccMean_X
Mean_TimeBodyAccMean_Y
Mean_TimeBodyAccMean_Z
Mean_TimeBodyAccStdDev_X
Mean_TimeBodyAccStdDev_Y
Mean_TimeBodyAccStdDev_Z
Mean_TimeGravityAccMean_X
Mean_TimeGravityAccMean_Y
Mean_TimeGravityAccMean_Z
Mean_TimeGravityAccStdDev_X
Mean_TimeGravityAccStdDev_Y
Mean_TimeGravityAccStdDev_Z
Mean_TimeBodyAccJerkMean_X
Mean_TimeBodyAccJerkMean_Y
Mean_TimeBodyAccJerkMean_Z
Mean_TimeBodyAccJerkStdDev_X
Mean_TimeBodyAccJerkStdDev_Y
Mean_TimeBodyAccJerkStdDev_Z
Mean_TimeBodyGyroMean_X
Mean_TimeBodyGyroMean_Y
Mean_TimeBodyGyroMean_Z
Mean_TimeBodyGyroStdDev_X
Mean_TimeBodyGyroStdDev_Y
Mean_TimeBodyGyroStdDev_Z
Mean_TimeBodyGyroJerkMean_X
Mean_TimeBodyGyroJerkMean_Y
Mean_TimeBodyGyroJerkMean_Z
Mean_TimeBodyGyroJerkStdDev_X
Mean_TimeBodyGyroJerkStdDev_Y
Mean_TimeBodyGyroJerkStdDev_Z
Mean_TimeBodyAccMagMean
Mean_TimeBodyAccMagStdDev
Mean_TimeGravityAccMagMean
Mean_TimeGravityAccMagStdDev
Mean_TimeBodyAccJerkMagMean
Mean_TimeBodyAccJerkMagStdDev
Mean_TimeBodyGyroMagMean
Mean_TimeBodyGyroMagStdDev
Mean_TimeBodyGyroJerkMagMean
Mean_TimeBodyGyroJerkMagStdDev
Mean_FrequencyBodyAccMean_X
Mean_FrequencyBodyAccMean_Y
Mean_FrequencyBodyAccMean_Z
Mean_FrequencyBodyAccStdDev_X
Mean_FrequencyBodyAccStdDev_Y
Mean_FrequencyBodyAccStdDev_Z
Mean_FrequencyBodyAccMeanFreq_X
Mean_FrequencyBodyAccMeanFreq_Y
Mean_FrequencyBodyAccMeanFreq_Z
Mean_FrequencyBodyAccJerkMean_X
Mean_FrequencyBodyAccJerkMean_Y
Mean_FrequencyBodyAccJerkMean_Z
Mean_FrequencyBodyAccJerkStdDev_X
Mean_FrequencyBodyAccJerkStdDev_Y
Mean_FrequencyBodyAccJerkStdDev_Z
Mean_FrequencyBodyAccJerkMeanFreq_X
Mean_FrequencyBodyAccJerkMeanFreq_Y
Mean_FrequencyBodyAccJerkMeanFreq_Z
Mean_FrequencyBodyGyroMean_X
Mean_FrequencyBodyGyroMean_Y
Mean_FrequencyBodyGyroMean_Z
Mean_FrequencyBodyGyroStdDev_X
Mean_FrequencyBodyGyroStdDev_Y
Mean_FrequencyBodyGyroStdDev_Z
Mean_FrequencyBodyGyroMeanFreq_X
Mean_FrequencyBodyGyroMeanFreq_Y
Mean_FrequencyBodyGyroMeanFreq_Z
Mean_FrequencyBodyAccMagMean
Mean_FrequencyBodyAccMagStdDev
Mean_FrequencyBodyAccMagMeanFreq
Mean_FrequencyBodyAccJerkMagMean
Mean_FrequencyBodyAccJerkMagStdDev
Mean_FrequencyBodyAccJerkMagMeanFreq
Mean_FrequencyBodyGyroMagMean
Mean_FrequencyBodyGyroMagStdDev
Mean_FrequencyBodyGyroMagMeanFreq
Mean_FrequencyBodyGyroJerkMagMean
Mean_FrequencyBodyGyroJerkMagStdDev
Mean_FrequencyBodyGyroJerkMagMeanFreq
Mean_angle_tBodyAccMean.gravity
Mean_angle_tBodyAccJerkMean.gravityMean
Mean_angle_tBodyGyroMean.gravityMean
Mean_angle_tBodyGyroJerkMean.gravityMean
Mean_angle_X.gravityMean
Mean_angle_Y.gravityMean
Mean_angle_Z.gravityMean



### Relevant Papers:
N/A
Citation Request:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

### License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
