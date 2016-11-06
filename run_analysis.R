library(pander)
library(dplyr)

if(!file.exists("./Download")) { dir.create("Download")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./Download/Data.zip")
unzip(zipfile="./Download/Data.zip",exdir="./Download")
#
#  Read in the Data Set
#
codebook <- Pandoc$new("Codebook","M. Carmichael")
text1 <- "Objectives Overview
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy 
data set with the average of each variable for each activity and each subject
6) As an additional objective, the code book needs to update with 
new data or analysis. For this reason the code book is being generated
in the run_analysis.R work, which documents the code as well as updating
the runbook."

codebook$add.paragraph(text1)
 
text1 <- "Objective 1 - merge the training and testing data sets.

The data files are loaded from d396qusza40orc.cloudfront.net
in a number of files. There are a set of people (subjects), numbered one 
to thirty. These subject have wearable monnitors which take measurements
(some 561) which are broken into 6 activities, walking, walking upstairs,
walking downstairs, sitting, standing, laying.  There tests are broken
into two sets of data, the training work, and the testing work. The data
files are stored into two directories (test, train). The testx/trainx contain
the 561 variables (columns), and some 7K observations in test and 2k
observations.  trainy/testy contain the activity code, the code translation
is found in the activity file. The trains/texts files contain the subject
identifier for the observations, hence we will add them to the output
as variables associated with observations. The features file contains the
names of the variables, which are not approproatly descriptive and will need
to be modified.  To merge the data sets we
1) Download the main data (test/train)
2) Add the subject data (as columns) to the test/train data
3) Add the activity data (as columns) to the test/ train data
4) combind the test/train data sets into the combind data set 
\n\n
data set combind

"
codebook$add.paragraph(text1)
#
trainx <- read.table("./Download/UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("./Download/UCI HAR Dataset/train/y_train.txt")
trains <- read.table("./Download/UCI HAR Dataset/train/subject_train.txt")
testx <- read.table("./Download/UCI HAR Dataset/test/X_test.txt")
testy <- read.table("./Download/UCI HAR Dataset/test/y_test.txt")
tests <- read.table("./Download/UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./Download/UCI HAR Dataset/features.txt")
activity <- read.table("./Download/UCI HAR Dataset/activity_labels.txt")
#
#  Create one data set
#
trainx$activity <- trainy[,1]
testx$activity <- testy[,1]
trainx$subject <- trains[,1]
testx$subject <- tests[,1]

#combind <- rbind(testx,trainx)
combind <- bind_rows(testx,trainx)
codebook$add(str(combind))

text1 <- "Objective 3/4
In order to optomize Objective 2, I will do Objective 3/4 renaming/labeling
first.  So take the number (which are now combined in the column named 
activity) are convered from numbers to text. In addition the column names
are now expanded, to be more desciptive. Special characters are removed,
and the names are convered to lower case.\n\n "

codebook$add.paragraph(text1)
#
#   Rename the fields and labels
#
combind[,'activity'] <- gsub("1","WALKING",combind[,'activity'])
combind[,'activity'] <- gsub("2","WALKING_UPSTAIRS",combind[,'activity'])
combind[,'activity'] <- gsub("3","WALKING_DOWNSTAIRS",combind[,'activity'])
combind[,'activity'] <- gsub("4","SITTING",combind[,'activity'])
combind[,'activity'] <- gsub("5","STANDING",combind[,'activity'])
combind[,'activity'] <- gsub("6","LAYING",combind[,'activity'])
combind[,'subject'] <- gsub("^","Subject",combind[,'subject'])
#
#  
columnname <- features[,2]
columnname <- gsub("^f","frequency",columnname)
columnname <- gsub("\\(|\\)|\\,|-","",columnname)
columnname <- gsub("^t","time",columnname)
columnname <- gsub("Acc","Accelerator",columnname)
columnname <- gsub("Mag","Magnitude",columnname)
columnname <- gsub("Gyro","Gryoscope",columnname)
columnname <- gsub("min","minimum",columnname)
columnname <- gsub("max","maximum",columnname)
columnname <- gsub("mad","median-absolute-deviation",columnname)
columnname <- gsub("iqr","interquartile-range",columnname)
columnname <- gsub("sma","signal-magnitutde-area",columnname)
columnname <- gsub("std","standard-deviation",columnname)
columnname <- gsub("arCoeff","Autoregression-coefficent",columnname)
columnname <- gsub("maxinds","mean-frequency",columnname)
columnname <-append(columnname,'subject')
columnname <-append(columnname,'activity')
columnname <-tolower(columnname)
#
#  Combind the data Set
#
colnames(combind) <- columnname
codebook$add(names(combind))
#
#  Create the selection for mean and standard
#
text1 <- "Objective 2
Since the column names are adjusted on the dataset 'combind' then we grep 
the right column names for our future required data set
selected column numbers\n\n"

codebook$add.paragraph(text1)

columnselect <- grep("mean|standard",columnname)

#
#  Create the tidy set, rename the columns
#
codebook$add(columnselect)
codebook$add.paragraph("\n\n")
#
text1 <- "Objective 5
The tidydata is created by selecting the appropraite data from the combined
data, then renaming the final dataset, called tidydata, then applying 
the mean function (for the average) of the variables. After which we write 
the file\n\n"

codebook$add.paragraph(text1)

tidydata <- aggregate(combind[,columnselect],by=list(combind$subject,combind$activity),FUN=mean)

tidynames <-names(tidydata)
tidynames[1] <- 'activity'
tidynames[2] <- 'subject'
colnames(tidydata) <- tidynames
#
#  write the data set
#
write.table(tidydata,file="tidydata.csv",sep=",")
codebook$add(head(tidydata))

codebook$format <- 'md'
codebook$export("Codebook", open = FALSE)
#
#  Generate the README file
#
readme <- Pandoc$new("README","M.Carmichael")

text1 <- "README

Getting and Cleaning Data Course Projectless 

Running the script 'run_analysis.R' will generate the tidydata.csv dataset,
in addition will create the Codebook, which describes the R script in detail
the process, and the methodology. 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard 
deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy 
data set with the average of each variable for each activity and each subject"

readme$add.paragraph(text1)

readme$format <- 'md'
readme$export("README", open = FALSE)
