# 0. PREP WORK

# loading dplyr package
library(dplyr)

# set dataset directory
setwd("~/Dropbox/Oxford/R/data/UCI HAR Dataset")

# reading in train & test data (X/Y/subject)
# TRAIN
x_train   <- read.table("./train/X_train.txt")
y_train   <- read.table("./train/Y_train.txt") 
sub_train <- read.table("./train/subject_train.txt")

# TEST
x_test   <- read.table("./test/X_test.txt")
y_test   <- read.table("./test/Y_test.txt") 
sub_test <- read.table("./test/subject_test.txt")

# reading in features & activity labels
features <- read.table("./features.txt") 
activity_labels <- read.table("./activity_labels.txt") 

############################################################################

# 1. Merging the training & the test sets to create one data set.

# merges data sets
x_merged <- rbind(x_train, x_test) 

# merges activity IDs
y_merged <- rbind(y_train, y_test) 

# merges subject IDs
sub_merged <- rbind(sub_train, sub_test) 

############################################################################

# 2. Extracting only the measurements on the mean and standard deviation 
# for each measurement.

m_std <- grep("mean\\(\\)|std\\(\\)",features[,2]) 
# variable names containing 'mean' or 'std'
m_std <- features[m_std,2] 

############################################################################

# 3. Using descriptive activity names to name the activities in the data set

# rename V1 -> subject ID
sub_merged <- rename(sub_merged, subject=V1)
# rename V1 -> activity ID
y_merged <- rename(y_merged, activity=V1 ) 

# combine subject IDs with merged dataset (train + test)
x_merged <- cbind(sub_merged, x_merged)
# combine activity IDs with merged dataset (train + test)
x_merged <- cbind(y_merged, x_merged) 



############################################################################

# 4. Appropriately labelling the data set with descriptive variable names.

#rename the variable names of the labels
activity_labels <- rename(activity_labels, act=V1, activity1=V2) 

x_merged <- merge(activity_labels, x_merged, by.x = "act", by.y = "activity")

# number of variables containins 'mean' or 'std' plus 3 (for activity labels & student ID)
l <- length(m_std)+3

# creating new data frame, only including the relevant variables
m_std_only_merged <- x_merged[,1:l]
# order by subject ID
m_std_only_merged <- arrange(m_std_only_merged, m_std_only_merged$subject) 

############################################################################

# 5. From the data set in step 4, creating a second, independent tidy data 
# set with the average of each variable for each activity and each subject.

tidy_data <- m_std_only_merged %>% 
        group_by(subject, activity1) %>% 
        summarize_all(funs(mean))

# saves this second tidy data to a new file
write.table(tidy_data, file = "TidyData2.txt" , row.name=FALSE) 


