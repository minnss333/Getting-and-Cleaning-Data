# Getting-and-Cleaning-Data

#Final project

This work is the final course work for "Getting and Cleaning Data" by Johns Hopkins University on Coursera. The goal of the analysis script is to produce a tidy dataset that satisfies the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Dataset
The original data used is [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

The files used for this specific project were:

features.txt - list of all the descriptive features of the measurements recorded in the dataset
features.txt - list of all the activities and their labels
train/X_train.txt - data on measurements of all the features in train set
test/X_test.txt - data on measurements of all the features in test set
train/subject_train.txt - subjects in the train set
test/subject_test.txt - subjects in the test set
train/y_train.txt - activity for each measurement in the train set
test/y_test.txt - activity for each measurement in the test set

#Analysis Script
After reading in all the necessary data, the analysis was done as follows:

First, all the datasets related to test and train were respectively merged to create test and train datasets which were then merged by stacking one over the other.

Second, I created a vector called "names" which are supposed to be a list of variable names of the merged data including "subject", "activity" and the list of all the measurement features listed in features.txt file. Then, I extracted only the features that contained "mean" or "std" by using grep.

Third, using the activity label table, the codes are supposed to match the activity number to the activty it corresponds to and the column with activity number gets written over with the actual descriptive names of the activity.

Fourth, I modified the names vector for the extracted dataset so that it is more legible and intuitive and assigned this to the variable names to the dataset.

Fifth, from the extracted dataset, I created a tidy data table that returns the mean value of each variables or measurement features grouped by subject and activity.