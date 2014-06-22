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
  - Concatenate columns from `subject_test`, `y_test`, `X_test` into a single data using `cbind()`
  - 

