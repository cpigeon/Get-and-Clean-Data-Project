## This is the Codebook for Getting and Cleaning Data Course Project for 
## Christa Pigeon 

## Below is a description of the files that contained the data necessary for this course project and how each file was read into R 

## features.txt   
## a text file containing 561 'features' that describe each observation of the data. Each feature represents a column
## this txt file was read into R using read.csv() and saved into the variable 'features'

## activity_labels.txt 
## a text file containing the 'code' for which number corresponds to which ## activity (walking, walking upstairs, walking downstairs, sitting, standing, and laying)
## this txt file was read into R using read.csv() and saved into the variable 'activities'


## xtest.txt 
## a text file that contains data on each features for 2947 observations of the test subset of volunteers 
## this txt file was read into R using read.csv and saved into the variable xtest. Column names were specified using the col.names argument and were set to features[,2]

## ytest.txt
## a text file that contains the corresponding activity ID for each of the
## 2947 observations of the test subset of volunteers 
## this text file was read into R using read.csv and saved into the variable ytest. Column name was specified using the col.names argument and was set to "ActivityID"

## subject_test.txt
## a text file that contains the corresponding participant ID for each of the 2947 observations of the test subset of volunteers
## this text file was read into R using read.csv and saved into the variable subjecttest. Column name was specified using the col.names argument and was set to "ParticipantID"

## xtrain.txt 
## a text file that contains data on each features for 7352 observations of the train subset of volunteers 
## this txt file was read into R using read.csv and saved into the variable xtrain. Column names were specified using the col.names argument and were set to features[,2]


## ytrain.txt
## a text file that contains the corresponding activity ID for each of the
## 7352 observations of the train subset of volunteers 
## this text file was read into R using read.csv and saved into the variable ytrain. Column name was specified using the col.names argument and was set to "ActivityID"


## subject_train.txt
## a text file that contains the corresponding participant ID for each of the 7352 observations of the train subset of volunteers
## this text file was read into R using read.csv and saved into the variable subjecttrain. Column name was specified using the col.names argument and was set to "ParticipantID"

## all data from the test group of participants was combined into one data frame using cbind with subjecttest, ytest, and xtest (in that order)

## all data from the train group of participants was combined into one data frame using cbind with subjecttrain, ytrain, and xtrain (in that order)

## the data from the test and train groups were combined into one data frame using rbind 

## Functions select() and contains() were used to select the ParticipantID, ActivityID, and all columns that contains "mean" and "std". The resulting data frame was saved as mean_std

## a for loop with the activities variable was used to rename the numbers in the ActivityID column with the corresponding activities 

## a series of calls to gsub replaced short hand naming in the columns of the mean_std data frame to contain more descriptive variable names 

## the average of each variable for activity and subject (i.e. ParticipantID), was calculated using calls to group_by(), summarise_all(), and funs(mean)

## the resulting data frame (Result) provides the mean of each feature that contains a reference to mean or std for each activity and subject 

## below is a concise summary of all the variables used/generated in the run_analysis.R script 

## variable           size          description 
## features           561 x 2       provides the names of all of the features (columns) in the xtrain/xtest data sets 
## activities         6 x 2         provides the correlation between activity number and activity name in the test data subset
## xtest              2947 x 561    provides values for the 561 features across 2947 observations in the test data subset
## ytest              2947 x 1      provides the activity for each of the 2947 recorded observations in the test data subset
## subjecttest        2947 x 1      provides the subject (i.e. ParticipantID) for each of the 2947 recorded observations 
## xtrain             7352 x 561    provides values for the 561 features across 7352 observations in the train data subset
## ytrain             7352 x 1      provides the activity for each of the 7352 recorded observations in the train data subset
## subjecttrain       7352 x 1      provides the subject (i.e. ParticipantID) for each of the 7352 recorded observations in the train data subset
## test               2947 x 563    data from the test subset compiled into one data frame using rbind
## train              7352 x 563    data from the train subset compiled into one data frame using rbind
## combined_df        10299 x 563   data from the test and train subsets compiled into one data frame using cbind 
## mean_std           10299 x 88    data from the test and train subsets from columns (features) that only reference mean & std 
## Result             180 x 88      the average value of features that only reference mean & std, grouped by activity and subject