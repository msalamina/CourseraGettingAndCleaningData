
## R script called run_analysis.R that does the following.

# set local directory before running - in my case setwd("C:/Users/mike/R/CleaningData")
#

# Load the data
features <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
trainData <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
testData <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
trainDataY <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")
testDataY <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")
activityLabels <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
subjectTestData <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
subjectTrainData <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

names(trainData) <- features[,2]
names(testData) <- features[,2]

mergeTrainData <- cbind(subjectTrainData, trainDataY, trainData)
mergeTestData <- cbind(subjectTestData, testDataY, testData)

#  Merges the training and the test sets to create one data set.
mergeData <- rbind(mergeTrainData, mergeTestData)

#  Uses descriptive activity names to name the activities in the data set
names(mergeData)[2] <- "ActivityCode"
names(mergeData)[1] <- "SubjectNumber"

labelledMergeData <- merge(activityLabels, mergeData, by.y = "ActivityCode", by.x = "V1")
names(labelledMergeData)[2] <- "ActivityName"

#  Extracts only the measurements on the mean and standard deviation for each measurement.
tempResult <- labelledMergeData[grep("mean|std|Activity|Subject", names(labelledMergeData))]

#  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Write data set
write.table(tempResult, file="MovementStatistics.csv", row.name=FALSE, sep=",")

