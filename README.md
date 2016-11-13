# CourseraGettingAndCleaningData
The script run.analysis.R requires local files in the directory where it is run for features, subjects, test and train data.

We first read the files into data sets, and merge the names of the features using cbind.

Training and test data sets are merged into one data set using rbind.

The activities and subject names are updated with understandable values (activity Name, Subject Number).

We then select the subset of the data which contains only the mean and standard deviation measurements (still many measurements as 
there are many different measurements taken)

THe result data set is written to "MovementStatistics.csv".
