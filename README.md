run_analysis.R
greener_98103
version 1.0
==================================================================
My run_analysis script outlines the following procedures:

Loads the Test and Training data sets (specific files listed below)

Merges the training and the test sets to create one data set.

Extracts only the measurements on the mean and standard deviation for each measurement. 

Uses descriptive activity names to name the activities in the data set

Appropriately labels the data set with descriptive variable names. 

Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

==================================================================

In general the Run script uses the following tools to perform the procedures outlined above:
The car package to recode the activity labels from numbers to text
The Dataframe package to record subject and activity together
cbind to concatenate columns from the data frame and the Test and Train datasets
The merge command to merge the test and train data sets together
reshape to melt the merged data set down
grep to filter the dataset for mean only columns (and not std())
Aggregate to collapse the data down and produce the average of each variable for each activity


Origin of the data:
==================================================================
This script tittled run_analysis processes data derived from the following study:
Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Experimental Design
==================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.


Recordings were performed using:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The repository includes the following files:
=========================================

- 'README.md' : this file

- 'run_analysis.R' : The script for performing the analysis discussed above

- 'CodeBook.md' : A file that describes the variables, the data, and any transformations or work that performed to clean up the data.

- 'meansbysubjectavgtidy.txt': a tidy data set with the average of each variable for each activity and each subject.  

-  Github repository:greener_98103/Course_Project_Getting_and_Cleaning_Data/Course_Project_Getting_and_Cleaning_Data
