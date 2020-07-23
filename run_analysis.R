setwd("~/Documents/Econometrics/R/Getting-and-Cleaning-Data")

#Reading the datasets
act_label <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

#Reading test datasets and setting variable names
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Reading train datasets and setting variable names
subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#Bringing test datasets together
test <- cbind(subj_test, y_test, x_test)
#Bringing train datasets together
train <- cbind(subj_train, y_train, x_train)

#1: Merging test and train dataset
data <- rbind(test, train)

#2: Extracting only the measurements on mean and standard deviation
names <- c("subject", "activity", as.character(features$V2))
meanstd <- grep("subject|activity|mean|std", names)
extracted <- data[, meanstd]

#3: Using descriptive activity names on activity dataset
names(act_label) <- c("activity_number", "activity_name")
extracted$V1.1 <- act_label$activity_name[extracted$V1.1]

#4: Labeling the dataset with appropriate variable names
extracted_names <- names[meanstd]
extracted_names <- gsub("mean", "Mean", extracted_names)
extracted_names <- gsub("std", "Std", extracted_names)
extracted_names <- gsub("gravity", "Gravity", extracted_names)
extracted_names <- gsub("[[:punct:]]", "", extracted_names)
extracted_names <- gsub("^t", "Time", extracted_names)
extracted_names <- gsub("^f", "Frequency", extracted_names)
extracted_names <- gsub("^anglet", "Angletime", extracted_names)
names(extracted) <- extracted_names

#5: Creating a tidy dataset with averages
library(dplyr)
tidy <- extracted %>% 
          group_by(subject, activity) %>%
          summarize_all(funs(mean))
write.table(tidy, file = "tidy.txt", row.names = FALSE)




