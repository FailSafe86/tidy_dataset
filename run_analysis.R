library(dplyr)

# read in data files from folder
# features = feature list
# activity_labels = activity numbers and names
# subject_test/train = subject id's
# X_test/train = measurement data
# y_test/train = activity labels for each measurement
features <- read.table("C:/Users/Thomas/OneDrive/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset/features.txt", 
                       quote = "\"",
                       col.names = c("feature_num","measurement"))
activity_labels <- read.table("C:/Users/Thomas/OneDrive/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset/activity_labels.txt", 
                              quote = "\"", 
                              col.names = c("activity_num","activity"))

# files from test folder
subject_test <- read.table("C:/Users/Thomas/OneDrive/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt", 
                           quote = "\"", 
                           col.names = c("subject_id"))
X_test <- read.table("C:/Users/Thomas/OneDrive/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("C:/Users/Thomas/OneDrive/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt", 
                     quote = "\"",
                     col.names = c("activity"))

# file from train folder
subject_train <- read.table("C:/Users/Thomas/OneDrive/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt", 
                            quote = "\"",
                            col.names = c("subject_id"))

X_train <- read.table("C:/Users/Thomas/OneDrive/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("C:/Users/Thomas/OneDrive/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt", 
                      quote = "\"",
                      col.names = c("activity"))

# load mgsub function
source('C:/Users/Thomas/OneDrive/Documents/R/functions/mgsub.R')
# function to rename feature names using mgsub function
feat.clean<-sapply(features[2], function(x) mgsub(c("[()]","-",","),c("","_","_"),x))

# add header names to train/test datasets
names(X_test)<-feat.clean
names(X_train)<-feat.clean

# search and return features that conatin "mean" or "std in the name
Xtest_data_sel<-grep("mean|std",names(X_test))
Xtrain_data_sel<-grep("mean|std",names(X_train))

# combine selected columns from train/test datasets with subject_id and y_test
df_test <- cbind(subject_test,y_test,X_test[Xtest_data_sel])
df_train <- cbind(subject_train,y_train,X_train[Xtrain_data_sel])

# merge train & test datasets together
df <- rbind(df_test,df_train)

activity_labels[,2][match(df$activity[1],activity_labels[,1])]

rm(list = setdiff(ls(),"df"))

write.table(df, file = "tidy_data.txt", row.name = FALSE)