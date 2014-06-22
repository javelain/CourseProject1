CourseProject1
==============

Getting and Cleaning Data Course Project

### Files on this repo
  - **run_analysis.R** : this is the script to be loaded in R to obtain the tidy data set from the Samsung data.
  - **RREADME.md** : this file present diferent files on this repo and describe how to use the script works.
  - **codebooks.tx** : this indicates all the variables and presents other relevant information about them.


### How to run the *run_analysis.R* scripts into R
  - Fist download the data for the project from the following link provide on the project description : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
  - Extract the downloaded zip file to you *working directory* so you should have the folder **"getdata-projectfiles-UCI HAR Dataset"** on your working directory (to know you working directory type `getwd()` on the R console)
  - load the **run_analysis.R** script into R. To load the script you could place the **run_analysis.R** script into your working directory and type the command on the R console: `source("run_analysis.R")`

### what the script *"run_analysis.R"* does
If you open the script on an editor (It can be Rstudio or Notepad++ or ...), you will see that each step is commented on the scripts. The script proceed as follow :
  - Load *subject_test.txt, y_test.txt, X_test.txt, subject_train.txt, y_train.txt, X_train.txt* into R variables name respectively `subject_test`, `y_test`, `X_test`, `subject_train`, `y_train`, `X_train`. I use `read.table()`
  - Concatenate columns from `subject_test`, `y_test`, `X_test` into a single data using `cbind()`. This concatenate data set is store on  the variable `dt_test`
  - Concatenate columns from `subject_train`, `y_train`, `X_train` into a single data using `cbind()`. This concatenate data set is store on  the variable `dt_train`
  - Combine the two data sets `dt_test` and `dt_train` into one data frame : `dt_combine`
  - Load the column names of `dt_combine` from the file *features.txt* using `read.table()`. The names is extract as vector using `unlist()`.
  - Extracts only the measurements on the mean and standard deviation for each measurement. I consider as *mean* the feature variables that contain *"mean()"* and I consider as *standard deviation* the feature variables that contain *"std()"*. I use **Regex** to extract the variables. The obtained data frame is store on `dt_extract`
  - I use the data from *activity_labels.txt* to set descriptive activity names on the `dt_extract` data frame. To do that I convert the `activity_label` column of the data frame `dt_extract` into factor and I name the level with the activity names from the *activity_labels.txt*  file.
  - I use **Regex** to Appropriately labels the data set with descriptive variable names. I just remove `()` and `-` from the original names and capitalize the letter `m` from `mean` and the letter `s` from `std`. 
  - I create a second, independent tidy data set with the average of each variable for each activity and each subject. I use the function `aggregate()`. This new data frame is store on `dt_final`.
  - The tidy data set `dt_final` is write on text file **"tidydata.txt"** on the current working directory.

### How to read the **"tidydata.txt"** file
To read into a variable (for example `dt`) the **"tidydata.txt"** file you could use this command into your R console : `dt <- read.table("tidydata.txt", header = T)`. After that, to have an overview of the tidy data set you could use `View(dt)`. 
  



