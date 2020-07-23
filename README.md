# Getting-and-Cleaning-Data

#Final project

This work is the final course work for "Getting and Cleaning Data" by Johns Hopkins University on Coursera. The goal of the analysis script is to produce a tidy dataset that satisfies the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Files in the repository

*CodeBook.md : describes the original dataset and any transformations that were made to obtain the final tidy data set
*run_analysis.R : contains all the codes for the data cleaning that was asked in the assignment and brief comments on them.
*tidy.txt : is a final tidy dataset that tabulates the mean value of each variable grouped by subject and activity. It was then exported into a .txt file.