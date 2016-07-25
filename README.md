# Getting-And-Cleaning-Data
Getting And Cleaning Data Course Project

Note:
This is the short course work for Coursera course "Getting and Clearning Data", which forms part of the Data Science specialization. The following are the basic introduction of what's found in this repository

Data being used
The main data being used is the data collected from the accelerometers from the Samsung Galaxy S smartphone.

There are 2 major categories of data set being used, one being the test data and the other is the training data.

These are the samples of the raw text files used
subject_train.txt => A list of participants denoted by integer from 1 to 30
X_train.txt => the actual data recorded by participants performing some of the training 
y_train.txt => the type of activities performed ie
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

About the script
run_analysis.R is created to automate the creation of a tidy dataset based on the course prerequisites




About the script and the tidy dataset

I created a script called run_analysis.R which will merge the test and training sets together. Prerequisites for this script:

the UCI HAR Dataset must be extracted and..
the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"
After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

About the Code Book

The CodeBook.md file explains the transformations performed and the resulting data and variables.
