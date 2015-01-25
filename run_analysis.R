##Funtion for reading file (if present)
readFile <- function (filename) {
  if (!file.exists(filename))
  {
    stop("filename not found" + filename)
  }
  read.table(filename)
}

## Funtion for getting data from X test and train files
getX_Data <- function () {
  dt_X_test <- readFile("./test/X_test.txt")
  dt_X_train <- readFile("./train/X_train.txt")
  dt_X <- rbind(dt_X_test, dt_X_train)
}

## Function for getting data from Y test and train files
getY_Data <- function() {
  dt_Y_test <- readFile("./test/y_test.txt")
  dt_Y_train <- readFile("./train/y_train.txt")
  dt_Y <- rbind(dt_Y_test, dt_Y_train)
}

## Function for getting data from Subject test and train files
getSubject_Data <- function(){
  dt_Subject_test <- readFile("./test/subject_test.txt")
  dt_Subject_train <- readFile("./train/subject_train.txt")
  dt_Subject <- rbind(dt_Subject_test, dt_Subject_train)
}

#### Cleaning process starts from here
setwd("./UCI HAR Dataset")

#Master for Activity Labels
dt_activity_labels <- readFile("activity_labels.txt")
dt_activity_labels <- dt_activity_labels[,2]


#Master for required mean and std features
dt_features <- readFile("features.txt")[,2]
dt_features_clean <- dt_features[grepl("^t[a-zA-Z]+\\-+mean|^t[a-zA-Z]+\\-+std", dt_features) == TRUE]

dt_X <- getX_Data()
colnames(dt_X) <- dt_features

##Extract Mean and Standard Deviations
dt_X <- dt_X[,dt_features_clean]


dt_Y <- getY_Data()
dt_Y[,2] <- dt_activity_labels[dt_Y[,1]]
## We only carry forward the Activity Label values
dt_Y <- dt_Y[[2]]


dt_Subject <- getSubject_Data()

##Merge Y to X
dt_X <- cbind(dt_X,dt_Y)

##Merge Subject to X
dt_cumulative_data <- cbind(dt_X,dt_Subject)


##Set colNames
colnames(dt_cumulative_data) <- c(as.character(dt_features_clean[sapply(dt_features_clean,is.factor)])
                                  ,"ActivityName","SubjectID")


melt_data <- melt(dt_cumulative_data, id=c("ActivityName","SubjectID"))
final_tidy_dataset <- cast(melt_data, SubjectID + ActivityName ~ variable, mean)

write.csv(final_tidy_dataset, file = "Tidy_Data.csv", row.names=FALSE)
