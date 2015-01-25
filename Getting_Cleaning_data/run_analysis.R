## This project is a partial fulfillment of Getting and Cleaning Data course by John Hopkins University.
# Given Data: A link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
# consists of 
#   1. Training Data
#   2. Test Data
#   3. Features Data
#   4. Activity Label
#   5. Features Info and
#   6. README File
#
# Required: 
#   1. Merge the training and the test sets to create one data set.
#   2. Extract only the measurements on the mean and standard deviation for each measurement. 
#   3. Use descriptive activity names to name the activities in the data set
#   4. Appropriately label the data set with descriptive variable names. 
#   5. Creates a second independent tidy data set with average of each variable for each activity and subject.
#
# Assumptions:
#   1. ZIP file is downloaded from the given link, unzipped, and made available in a local folder
#   2. All data manipulation will be performed on a local unzipped file
#   3. Required packages will be installed and loaded as and when required
#
# ------------------------------------------------------------------------------------------------------------
# 1. Merge the training and the test sets to create one data set.
#
# 1.a Set working Directory to a local one.
setwd("C:/courses/3-Getting and Cleaning Data/Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

# 1.b Read All Training data first in the order how they will be merged together
subject_train_data <- read.table("./train/subject_train.txt")
y_train_data <- read.table("./train/y_train.txt")
x_train_data <- read.table("./train/X_train.txt")

# 1.c Merge All Training data together
merged_train_data <- cbind(subject_train_data, y_train_data, x_train_data)

# 1.d Read All Test data first in the order how they will be merged together
subject_test_data <- read.table("./test/subject_test.txt")
y_test_data <- read.table("./test/y_test.txt")
x_test_data <- read.table("./test/X_test.txt")

# 1.e Merge All Test data together
merged_test_data <- cbind(subject_test_data, y_test_data, x_test_data)

# 1.f Merge both Training and Test data together
merged_data <- rbind(merged_train_data, merged_test_data)

# ------------------------------------------------------------------------------------------------------------
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# Before filtering dataset columns based a given criteria, attach column labels to the dataset
#
# 2.a Read the complete "Features" file
features_data <- read.table("./features.txt")

# 2.b Extract only the required dataset from Features dataset and convert it into Vector to append more labels
labels <- as.vector (features_data$V2)

# 2.c Append "subjectID" and "activityID" labels
labels <- append(labels, cbind("subjectID", "activityID"), after=0)

# 2.d  Attach created Labels with main merged Dataset
names(merged_data) <- labels

# 2.e Filter columns that contain "std" or "mean" to select
colsWithMeanOrStd <- grepl("mean|std", labels)

# 2.f Set the first two columns ("subjectID" and "activityID")as well to TRUE as they are the main ones.
colsWithMeanOrStd[1:2] <- TRUE

# 2.g select all the rows that contain columns "std" or "mean"
merged_data <- merged_data[, colsWithMeanOrStd]

# ------------------------------------------------------------------------------------------------------------
# 3. Use descriptive activity names to name the activities in the data set
#
# 3.a Read Activity Descriptions from the given file and tidy up a bit
activity_data <- read.table("./activity_labels.txt")
activity_desc <- gsub("_", "", tolower(activity_data$V2))

# 3.b Replace activity ID with Activity Name
merged_data$activityID <- factor(merged_data$activityID, labels=activity_desc) 

# ------------------------------------------------------------------------------------------------------------
# 4. Appropriately label the data set with descriptive variable names. 
#
# 4.a Tidy-up duplicated and abbreviated column names as needed
colLabel <- names(merged_data) 
colLabel <- gsub("BodyBody", "Body", colLabel) 
colLabel <- gsub("Acc", "Acceleration", colLabel) 
colLabel <- gsub("Freq", "Frequency", colLabel) 
colLabel <- gsub("Mag", "Magnitude", colLabel) 
colLabel <- gsub("-mean", "Mean", colLabel) 
colLabel <- gsub("-std", "StandardDeviation", colLabel)
colLabel <- gsub("\\(|\\)", "", colLabel)

# 4.b Reasign Column names to the main dataset
names(merged_data) <- colLabel 

# ------------------------------------------------------------------------------------------------------------
# 5. Create a second independent tidy data set with average of each variable for each activity and subject.
# To calculate average values based of certain columns alone in a dataset, first install and source library ddply
#
# 5.a Install ddply package
install.packages("ddply")
library(plyr)

# 5.b Calculate average values and create a new dataset
final_data <- ddply(merged_data, c("subjectID", "activityID"), numcolwise(mean))

# 5.c Write newly created dataset into a new file
write.table(final_data, file = "final_clean_data.txt", row.names = FALSE)
