This project is a partial fulfillment of Getting and Cleaning Data course by John Hopkins University.
Given Data: A link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
consists of 
  1. Training Data
  2. Test Data
  3. Features Data
  4. Activity Label
  5. Features Info and
  6. README File

Required: 
  1. Merge the training and the test sets to create one data set.
  2. Extract only the measurements on the mean and standard deviation for each measurement. 
  3. Use descriptive activity names to name the activities in the data set
  4. Appropriately label the data set with descriptive variable names. 
  5. Creates a second independent tidy data set with average of each variable for each activity and subject.

Assumptions:
  1. ZIP file is downloaded from the given link, unzipped, and made available in a local folder
  2. All data manipulation will be performed on a local unzipped file
  3. Required packages will be installed and loaded as and when required

============================================================================================================
1.Merge the training and the test sets to create one data set.

1.a Set working Directory to a local one. <br>
1.b Read All Training data first in the order how they will be merged together<br>
1.c Merge All Training data together<br>
1.d Read All Test data first in the order how they will be merged together<br>
1.e Merge All Test data together<br>
1.f Merge both Training and Test data together<br>

------------------------------------------------------------------------------------------------------------
2.Extract only the measurements on the mean and standard deviation for each measurement. 
Before filtering dataset columns based a given criteria, attach column labels to the dataset

2.a Read the complete "Features" file<br>
2.b Extract only the required dataset from Features dataset and convert it into Vector to append more labels<br>
2.c Append "subjectID" and "activityID" labels<br>
2.d  Attach created Labels with main merged Dataset<br>
2.e Filter columns that contain "std" or "mean" to select<br>
2.f Set the first two columns ("subjectID" and "activityID")as well to TRUE as they are the main ones.<br>
2.g select all the rows that contain columns "std" or "mean"<br>

------------------------------------------------------------------------------------------------------------
3.Use descriptive activity names to name the activities in the data set

3.a Read Activity Descriptions from the given file and tidy up a bit<br>
3.b Replace activity ID with Activity Name<br>

------------------------------------------------------------------------------------------------------------
4.Appropriately label the data set with descriptive variable names. 

4.a Tidy-up duplicated and abbreviated column names as needed<br>
4.b Reasign Column names to the main dataset<br>

------------------------------------------------------------------------------------------------------------
5.Creates a second independent tidy data set with average of each variable for each activity and subject.
To calculate average values based of certain columns alone in a dataset, first install and source library ddply

5.a Install ddply package<br>
5.b Calculate average values and create a new dataset<br>
5.c Write newly created dataset into a new file<br>
