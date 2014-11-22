tidy_dataset
=============================================================================================================================
Coursera - Getting and Cleaning Data Project
=============================================================================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
=============================================================================================================================

The dataset includes the following files:
=========================================
- tidy_data.txt: finished tidy dataset produced from running analysis
- mgsub.R: helper function to deal with naming features
- run_analysis.R: function to produce tidy dataset
- CodeBook.md: description of variables in tidy_data.txt

Data is imported from the various files included in the UCI HAR Dataset provided. These inluded:
================================================================================================
features.txt
activity_labels.txt
subject_test.txt
x_test.txt
y_test.txt
subject_train.txt
x_train.txt
y_train.txt

please refer to the CodeBook.md for a full description the variables above.

1. features are renamed using a custom function called mgsub which relabelled all the feature names so all symbol characters and spaces where removed. 
2. column names of x_train and x_test where added from the new features vector.
3. filtered dataset for variables that contained the mean and/or std.
4. add subject_id, y_train and y_test columns to dataset 
5. merge train dataset with test dataset.
6. added activity labels.
7. write data frame to csv file.
=============================================================================================================================
Notes:
- Features are normalized and bounded within [-1,1].
