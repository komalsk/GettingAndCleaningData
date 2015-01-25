##Assumptions
-	Data is downlodaed and available in working directory UCI HAR Dataset.

##How Data is cleaned using run_analysis.R

-	Read the features file.
-	Clean the features file by eliminating the feature number and retain only those features that start with character 't' and have mean/std in their name.
-	Above step returns 40 features.
-	Read the activity lables files.
-	Read the Y files (that have activity numbers) from test and train folders and combine them into one Y file.
-	Convert activity numbers to lables in Y file.
-	Read the X files (that have signal readings) from test and train folders and combine them into one X file. This file haas 561 columns.
-	Clean X file by retaining only 40 extracted features in the file and eliminating rest of the columns.
-	Read the subject files (that have volunteer id) from test and train folders and combine them into one Subject file.
-	Join X, Y and Subject files into a cumulative dataset with total 42 columns.
-	Melt and Cast the cumulative dataset on Activity and Subject varialbles to get the tidy data set having average of each variable for each activity and each subject.
-	This will result in dataset with 180 observations (30*6 i.e. 30 volunteers doing six activities).

## Data Fields

The columns in tidy data set are as follows.

|Column No.|Column Name|
|----------|-----------|
|1|SubjectID|
|2|ActivityName|
|3|tBodyAcc-mean()-X|
|4|tBodyAcc-mean()-Y|
|5|tBodyAcc-mean()-Z|
|6|tBodyAcc-std()-X|
|7|tBodyAcc-std()-Y|
|8|tBodyAcc-std()-Z|
|9|tGravityAcc-mean()-X|
|10|tGravityAcc-mean()-Y|
|11|tGravityAcc-mean()-Z|
|12|tGravityAcc-std()-X|
|13|tGravityAcc-std()-Y|
|14|tGravityAcc-std()-Z|
|15|tBodyAccJerk-mean()-X|
|16|tBodyAccJerk-mean()-Y|
|17|tBodyAccJerk-mean()-Z|
|18|tBodyAccJerk-std()-X|
|19|tBodyAccJerk-std()-Y|
|20|tBodyAccJerk-std()-Z|
|21|tBodyGyro-mean()-X|
|22|tBodyGyro-mean()-Y|
|23|tBodyGyro-mean()-Z|
|24|tBodyGyro-std()-X|
|25|tBodyGyro-std()-Y|
|26|tBodyGyro-std()-Z|
|27|tBodyGyroJerk-mean()-X|
|28|tBodyGyroJerk-mean()-Y|
|29|tBodyGyroJerk-mean()-Z|
|30|tBodyGyroJerk-std()-X|
|31|tBodyGyroJerk-std()-Y|
|32|tBodyGyroJerk-std()-Z|
|33|tBodyAccMag-mean()|
|34|tBodyAccMag-std()|
|35|tGravityAccMag-mean()|
|36|tGravityAccMag-std()|
|37|tBodyAccJerkMag-mean()|
|38|tBodyAccJerkMag-std()|
|39|tBodyGyroMag-mean()|
|40|tBodyGyroMag-std()|
|41|tBodyGyroJerkMag-mean()|
|42|tBodyGyroJerkMag-std()|