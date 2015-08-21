## Set up working directory.
setwd("/Users/username/Documents/Course Project")

library(reshape2)
library(data.table)
## run_analysis.R does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Download and process x_test, y_test, and subject_test data.

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Download and process x_train, y_train, and subject_train data.

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Download data column names

features <- read.table("./UCI HAR Dataset/features.txt")[,2]

## Locate mean and standard devation names.

features_names <- grepl("mean|std", features)

## Extract the measurements on mean and standard deviation for each measurement.

std_mean_test = x_test[,features_names]
std_mean_train = x_train[,features_names]

## Download activity labels. 

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

## Assign each activity id with its respective activity label and name the columns as such.

y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")

## Appropriately labels the data set with descriptive activity names.

names(subject_test) = "Subject"
names(subject_train) = "Subject"
names(x_test) = features
names(x_train) = features

## Merge test data.

test_data <- cbind(as.data.table(subject_test), y_test, x_test)

## Merge train data.

train_data <- cbind(as.data.table(subject_train), y_train, x_train)

### Merge test and train data.

data_set <- rbind(test_data, train_data)

##Create melted data set that sets data_labels as variables for the data set.

id_labels   = c("Subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data_set), id_labels)
melt_data_set      = melt(data_set, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function.

tidy_data   = dcast(melt_data_set, Subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt", row.names = FALSE)
