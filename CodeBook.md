#CodeBook

#Dataset
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

First, all the datasets related to test and train were respectively merged using cbind to create test and train datasets which were then merged using rbind by stacking one over the other.

Second, I created a vector called "names" which are supposed to be a list of variable names of the merged data including "subject", "activity" and the list of all the measurement features listed in features.txt file. Then, I extracted the column number of only the elements that contained the words "subject", "activity", "mean" or "std" from the names vector and assigned it to meanstd. Finally, by using the column numbers saved in meanstd, I could subeset the dataset to somthing that would only contain measurements on mean and standard deviation which I called extracted.

Third, I named the variables in activity label table with the first column being "activity_number" and the second "activity_name". Afterwards, using the same dataset, the codes look up in the activity label table to match the activity number in the "activity" column of the extracted datset to the activty it corresponds to. Thenm the column "activity" in the extracted dataset gets written over with the actual descriptive names of the activity.

Fourth, I modified the names vector for the extracted dataset so that it is more legible and intuitive and assigned this to the variable names to the dataset. I mainly did this using gsub. For any variable names that contains "mean", "std" and "gravity", I substituted that part of the variable name with a capital letter. For any variable names that starts contains a punctuation mark, the punctuation will get omitted from the variable name. For any variable names that start with "t", the "t" will be substituted with "Time". A similar idea applies to those that start with "f" and "anglet"

Fifth, from the extracted dataset, I created a tidy data table that returns the mean value of each variables or measurement features grouped by subject and activity. I first had to group the extracted dataset by subjet and activity. Then, using summarize_all with a mean function, I could create a table with mean values for each subject doing each activity. I saved the table as tidy which was then exported into a .txt file.