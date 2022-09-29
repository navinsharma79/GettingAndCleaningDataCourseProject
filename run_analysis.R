## Load Libraries
library(dplyr)
library(tidyr)

## Load raw data

## This is loading the feature and activity information
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,sep="")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,sep="",col.names=(c("ActivityCode","ActivityName")))

## This is loading the train data: subjects, activity labels, and the activity data
trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep="",col.names=c("Subject"))
trainActivityLabels <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE,sep="",col.names=c("Activity"))
trainActivitySet <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE,sep="",col.names=features$V2)

## This is loading the test data: subjects, activity labels, and the activity data
## I am also loading the data with descriptive names using col.names
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep="",col.names=c("Subject"))
testActivityLabels <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE,sep="",col.names=c("Activity"))
testActivitySet <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE,sep="",col.names=features$V2)

## Here I am combining the train data into one data table by column binding the three loaded datasets
train <- cbind(trainSubjects,trainActivityLabels,trainActivitySet)

## Here I am combining the test data into one data table by column binding the three loaded datasets
test <- cbind(testSubjects,testActivityLabels,testActivitySet)

## Now I need to combine the train and test data into one table by row binding the test data below the trian data
rawData <- rbind(train,test)

## Now I need to replace the activity code with the activity names
rawData <- rawData %>% mutate(Activity=activities[Activity,2])
##rawData$Activity <- activities[rawData$Activity,2]

## At this point I have all the data in one data set
## HOWEVER, I have not culled the data to only include the mean and std readings

featureInclude <- filter(features,grepl("mean\\(\\)|std\\(\\)",features$V2))
##featureInclude <- grep("mean\\(\\)|std\\(\\)",features$V2,value=TRUE)
filteredData <- rawData[,c(1,2,featureInclude[,1]+2)]

colnames(filteredData) <- gsub("\\.","",colnames(filteredData))
colnames(filteredData) <- gsub("\\.","",colnames(filteredData))
colnames(filteredData) <- gsub("mean","Mean",colnames(filteredData))
colnames(filteredData) <- gsub("std","Std",colnames(filteredData))

## Now I have all the data in one set with just the mean and std for each activity
## However the data isn't tidy. The columns for the features should actually be 
## a variable in one column labeled feature
## I will reshape the data to create this tidy data set
## I am using the tidyr package (similar to the swirl lesson) to do this
tidyData <- gather(filteredData,"Feature","Value",colnames(filteredData[,3:ncol(filteredData)]))

## now I will group by the three variables: Subject, Activity, and Feature
## I will summarize the Value by mean
groupedData <- group_by(tidyData,Subject,Activity,Feature)
summarizedData <- summarize(groupedData,Mean=mean(Value))

