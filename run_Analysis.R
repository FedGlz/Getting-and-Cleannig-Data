library(readr)
library(dplyr)
setwd("~/Desktop/Data Science/Cleaning Data/Assignment/UCI HAR Dataset")

#Reading Data
features <- read.table("features.txt")
labels <- read.table("activity_labels.txt")
Test_X <- read.table("test/X_test.txt")
Test_label <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#Assigning Column Names
   colnames(features) <- c("FeatureID","Feature")
   colnames(labels) <- c("ActivityID","ActivityName")
   colnames(Test_X) <- features$Feature
   colnames(Test_label) <- "ActivityID"
   colnames(subject_test) <- "SubjectID"

#Merge Test Data
test <- bind_cols(Test_label,subject_test, Test_X)

#Reading Train Data
Train_X <- read.table("train/X_train.txt")
Train_label <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#Assigning Column Names to Train
names(Train_X) <- features$Feature
names(Train_label) <- "ActivityID"
names(subject_train) <- "SubjectID"

#Merge Train Data
train <- bind_cols(Train_label,subject_train,Train_X)

#Merge train and test data
master <- bind_rows(test,train)

#Extract mean and standard deviation values
master_mean_sd <- master[,grepl("mean|std|ActivityID|SubjectID",colnames(master))]

#Uses descriptive activity names to name the activities in the data set
master_mean_sd <- full_join(master_mean_sd,labels, by="ActivityID",match="first")
master_mean_sd <- master_mean_sd[,-1]

#Appropriately labels the data set with descriptive variable names

names(master_mean_sd) <- gsub("\\(|\\)","",names(master_mean_sd))
names(master_mean_sd) <- gsub("BodyBody","Body",names(master_mean_sd))
names(master_mean_sd) <- gsub("mean","Mean",names(master_mean_sd))
names(master_mean_sd) <- gsub("std","Std",names(master_mean_sd))
names(master_mean_sd) <- gsub("^t","Time",names(master_mean_sd))
names(master_mean_sd) <- gsub("^f","Frecuency",names(master_mean_sd))
names(master_mean_sd) <- gsub("Acc","Acceleration",names(master_mean_sd))
names(master_mean_sd) <- gsub("Gyro","AngularVelocity",names(master_mean_sd))
names(master_mean_sd) <- gsub("Freq","Frequency",names(master_mean_sd))
names(master_mean_sd) <- gsub("Mag","Magnitud",names(master_mean_sd))

#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Table2 <- aggregate(x= master_mean_sd[,!names(master_mean_sd) %in% c("ActivityName","SubjectID")] ,by= master_mean_sd[c("ActivityName","SubjectID")] ,FUN= mean)
write.table(Table2,"Tidy_Data", row.names = FALSE)

