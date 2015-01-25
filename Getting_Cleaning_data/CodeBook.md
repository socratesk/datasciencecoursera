<b>About Code Book:</b><br><br>
<t>A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

<b>Introduction:</b><br><br>
	This program <br>
	<ul>
	<li> Retrieves the data from both training and test sets<br>
	<li> Combines Subjects and Activities data with main observation<br>
	<li> Adds Label to each Column in the dataset<br>
	<li> Filters / selects columns that contain "std" or "mean"<br>
	<li> Cleans-up Column Label<br>
	<li> Computes average of observed data and <br>
	<li> writes a new dataset to a .txt file<br>
</ul>
<b>Description of Variables:</b><br>
	
	a. Subject: There are 30 volunteers within an age bracket of 19-48 years participated in this experiment and their activities are observed. 
	So each observer/subject is named as 1,2,3, ..., 29, 30.
	
	b. Activities: In the main dataset the activities are labelled from 1 to 6. Following the description of each activity
		1 WALKING
		2 WALKING_UPSTAIRS
		3 WALKING_DOWNSTAIRS
		4 SITTING
		5 STANDING
		6 LAYING

	c. Feature: The following features were either recorded or estimated or calculated during this experiment on 30 subjects.
		
		Signals that were observed in the X, Y and Z directions ('-XYZ' is used to denote 3-axial signals):
			tBodyAcc-XYZ
			tGravityAcc-XYZ
			tBodyAccJerk-XYZ
			tBodyGyro-XYZ
			tBodyGyroJerk-XYZ
			tBodyAccMag
			tGravityAccMag
			tBodyAccJerkMag
			tBodyGyroMag
			tBodyGyroJerkMag
			fBodyAcc-XYZ
			fBodyAccJerk-XYZ
			fBodyGyro-XYZ
			fBodyAccMag
			fBodyAccJerkMag
			fBodyGyroMag
			fBodyGyroJerkMag
	
		Variables that were estimated from these signals: 
			mean(): Mean value
			std(): Standard deviation
			mad(): Median absolute deviation 
			max(): Largest value in array
			min(): Smallest value in array
			sma(): Signal magnitude area
			energy(): Energy measure. Sum of the squares divided by the number of values. 
			iqr(): Interquartile range 
			entropy(): Signal entropy
			arCoeff(): Autorregresion coefficients with Burg order equal to 4
			correlation(): correlation coefficient between two signals
			maxInds(): index of the frequency component with largest magnitude
			meanFreq(): Weighted average of the frequency components to obtain a mean frequency
			skewness(): skewness of the frequency domain signal 
			kurtosis(): kurtosis of the frequency domain signal 
			bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
			angle(): Angle between to vectors.

		Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
			gravityMean
			tBodyAccMean
			tBodyAccJerkMean
			tBodyGyroMean
			tBodyGyroJerkMean
