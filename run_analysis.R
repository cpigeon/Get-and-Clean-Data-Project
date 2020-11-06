library(dplyr)

## read in all data frames
## read in features & activity labels 
features <- read.csv('features.txt', sep = "", header = FALSE, stringsAsFactors = FALSE)
activities <- read.csv('activity_labels.txt', sep = "", header = FALSE, stringsAsFactors = FALSE)

## read in the test data
xtest <- read.csv("./test/X_test.txt", sep = "", header = FALSE, col.names = features[,2])
ytest <- read.csv("./test/y_test.txt", sep = "", header = FALSE, col.names = c("ActivityID"))
subjecttest <- read.csv("./test/subject_test.txt", sep = "", header = FALSE, col.names = c("ParticipantID"))

## read in the train data
xtrain <- read.csv("./train/X_train.txt", sep = "", header = FALSE, col.names = features[,2])
ytrain <- read.csv("./train/y_train.txt", sep = "", header = FALSE, col.names = c("ActivityID"))
subjecttrain <- read.csv("./train/subject_train.txt", sep = "", header = FALSE, col.names = c("ParticipantID"))

## combine separate test data frames(xtest, ytest, subjecttest)
## into one combined data frame 
test <- cbind(subjecttest, ytest, xtest)

## combine separate train data frames (xtrain, ytrain, subjecttrain)
## into one combined data frame
train <- cbind(subjecttrain, ytrain, xtrain)

## merge the test & training data frames into one data frame 
combined_df <- rbind(train, test)

## extract only the mean and standard deviation for each measurement 
mean_std <- select(combined_df, ParticipantID, ActivityID, contains("mean"),
                   contains("std"))

## name activity names
for (i in 1:nrow(activities)) {
  mean_std[,2] <- gsub(i, activities[i,2], mean_std[,2])
}

## label data with descriptive variables
colnames(mean_std) <- gsub("tBody", "Time Body", colnames(mean_std))
colnames(mean_std) <- gsub("Acc", " Acceleration", colnames(mean_std))
colnames(mean_std) <- gsub("tGravity", "Time Gravity", colnames(mean_std))
colnames(mean_std) <- gsub("Gyro", " Gyroscope", colnames(mean_std))
colnames(mean_std) <- gsub("Mag", "Magnitude", colnames(mean_std))
colnames(mean_std) <- gsub("Freq", "Frequency", colnames(mean_std))
colnames(mean_std) <- gsub("fBody", "Frequency Body", colnames(mean_std))
colnames(mean_std) <- gsub("tGravity", "Time Gravity", colnames(mean_std))


## average of each variable for each activity & subject 
Result <- mean_std %>% group_by(ParticipantID, ActivityID) %>% 
  summarise_all(funs(mean))

