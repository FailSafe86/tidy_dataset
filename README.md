tidy_dataset
============

Coursera - Getting and Cleaning Data Project

Data is imported from the various files and colated in 'R' global environment. 
features
activity_labels
subject_test
x_test
y_test
subject_train
x_train
y_train

please refer to the CodeBook.md for a full description the variables above.

1. features are renamed using a custom function called mgsub which relabelled all the feature names so all symbol characters and spaces where removed. 
2. column names of x_train and x_test where added from the new features vector.
3. filtered dataset for variables that contained the mean and/or std.
4. add subject_id, y_train and y_test columns to dataset 
5. merge train dataset with test dataset.
6. added activity labels.
7. write data frame to csv file.