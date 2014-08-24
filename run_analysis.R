library (plyr)
setwd("~/Rstudio/Getting and cleaning data/UCI HAR Dataset")
## Read Training input Data
features <- read.table("features.txt", header=FALSE, quote="\"")
activity_labels <- read.table("activity_labels.txt", quote="\"")
subject_train <- read.csv("train/subject_train.txt", header=FALSE)
X_train <- read.table("train/X_train.txt", quote="\"")
y_train <- read.table("train/y_train.txt", quote="\"")
## Read test input data
subject_test <- read.table("test/subject_test.txt", quote="\"")
X_test <- read.table("test/X_test.txt", quote="\"")
y_test <- read.table("test/y_test.txt", quote="\"")
## Assigning names to the columns
colnames(y_train) = "activityId"
colnames(y_test)="activityId"
colnames(activity_labels)=c("activityId", "activityName")
colnames(subject_train)="subjectId"
colnames(X_train)=features$V2
colnames(subject_test)="subjectId"
colnames(X_test)=features$V2
## Create the training data set by merging y_train, subject_train and  x_train
trainingSet=cbind(y_train,subject_train,X_train)
## Create the training data set by merging y_test, subject_test and  x_test
testSet=cbind(y_test,subject_test,X_test)
##  Merge the training and the test sets to create one data set
data=rbind(trainingSet,testSet)
## Extract only the measurements on the mean and standard deviation for each measurement.
colIndex=sort(c(grep("mean",colnames(data)),grep("std",colnames(data)),1,2))
tidydata=data[colIndex]
## Create a second, independent tidy data set with the average of each variable for each activity and each subject.
data.means <- aggregate(tidydata[3:81],by=tidydata[c("activityId","subjectId")],FUN=mean)
##Appropriately label the data set with descriptive variable names.
colnames(tidydata)=gsub("-mean","Mean",colnames(tidydata))
colnames(tidydata)=gsub("-std","Stdev",colnames(tidydata))
colnames(tidydata)=gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colnames(tidydata))
##Use descriptive activity names to name the activities in the data set
finalData=merge(tidydata,activity_labels,by='activityId', all.x=TRUE)
finalData <- subset(finalData, select=c(1:2,82,3:81))
##Export the  final dataset
write.table(finalData, './finalData.txt',row.names=TRUE,sep='\t')
