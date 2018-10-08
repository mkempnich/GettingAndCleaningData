# GettingAndCleaningData
coursera getting and cleaning data week 4 assignment

I created this repo as part of the coursera "Getting & Clearning Data" course requirements. 
It contains the script requested in week 4's assignment.

 1) Download & unzip the data file into your R working directory. (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
 2) Download the R source code into your R working directory. ("run_analysis.R")
 3) Run above R source code to reproduce the tidy data.

### Data Description (taken from 

The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. 
The variable in the data Y indicates activity type the subjects performed during recording.

### Code Explaination

The code first combined training dataset and test dataset, then extracted partial variables to create another dataset with the averages of each variable for each activity.

### New Dataset

The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

### Assignment Instructions:

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
