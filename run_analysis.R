cat("Wait ...") # As info.

##Load subject_test.txt, y_test.txt, X_test.txt, subject_train.txt, y_train.txt, X_train.txt into R

  #test sets
subject_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
X_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", sep="")

  #train sets
subject_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
X_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", sep="")

## Concatenate columns from subject_test, y_test, X_test files into a single data set
dt_test <- cbind(subject_test, y_test, X_test)

##Concatenate columns from subject_train, y_train, X_Train files into a single data set
dt_train <- cbind(subject_train, y_train, X_train)

##Combine the two data sets into one
dt_combine <- rbind(dt_test,dt_train)

## Load the column names
features <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
names <- unlist(features[,2])

# Set the Columns features names
names(dt_combine) <- c("Subject", "Activity_label", names)

#Extracts only the measurements on the mean and standard deviation for each measurement.
mean = grepl("mean\\(\\)", names(dt_combine))
std = grepl("std\\(\\)", names(dt_combine))
subject = names(dt_combine) == "Subject"
label = names(dt_combine) == "Activity_label"
dt_extract <- dt_combine[,mean | std | subject | label]

#Use descriptive activity names to name the activities in the data set
activity_label <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
activity_names <- unlist(activity_label[,2])
dt_extract$Activity_label <- as.factor(dt_extract$Activity_label)
levels(dt_extract$Activity_label) <- activity_names

#Appropriately labels the data set with descriptive variable names. 
names(dt_extract) <- chartr("ms", "MS",gsub("[\\( | \\)|-]","",names(dt_extract)))

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dt_final <- aggregate(dt_extract[,3:ncol(dt_extract)], list("subject" = dt_extract$Subject, "activity" = dt_extract$Activity_label), mean)

#create a text file with the tidy data set according to the instructions
write.table(dt_final,"tidydata.txt",sep="\t",row.names=F)

# end
cat("\nFinish!\n")
cat("\nThe tidy data set stored on the variable \"dt_final\" is write on the \"tidydata.txt\" file place in the directory : ", getwd(), 
    ".\nTo have an overview of this tidy data use the \"View(dt_final)\" command.")


