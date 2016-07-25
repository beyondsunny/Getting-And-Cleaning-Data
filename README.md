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

These are prerequisites for the scripts
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Code Book
CodeBook.md file contains the explanation of the transformation performed as well as the resulting data
