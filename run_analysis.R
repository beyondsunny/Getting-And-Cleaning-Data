run_analysis<-function(x){
  
  #data <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  #download.file(data, destfile = "D:/MYDOCUMENT/coursera/Getting And Cleaning Data/PROJECT/data.xlsx",method = "auto", mode ="wb")
  
  #GET ALL THE SUBJECT WHO PERFORM EITHER TEST/TRAINING IDENTIFIED BY A RANGE OF 1 TO 30
  subjecttrainurl<-"D:/MYDOCUMENT/coursera/Getting And Cleaning Data/PROJECT/UCI HAR Dataset/train/subject_train.txt"
  subjecttrain<-read.csv(subjecttrainurl)
  subjecttesturl<-"D:/MYDOCUMENT/coursera/Getting And Cleaning Data/PROJECT/UCI HAR Dataset/test/subject_test.txt"
  subjecttest<-read.csv(subjecttesturl)
  
  #GET TRAINING SET
  xtrainurl<-"D:/MYDOCUMENT/coursera/Getting And Cleaning Data/PROJECT/UCI HAR Dataset/train/X_train.txt"
  xtrain<-read.csv(xtrainurl)
  #GET TRAINING LABEL ie 1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS etc
  ytrainurl<-"D:/MYDOCUMENT/coursera/Getting And Cleaning Data/PROJECT/UCI HAR Dataset/train/y_train.txt"
  ytrain<-read.csv(ytrainurl)
  
  #GET TEST SET
  xtesturl<-"D:/MYDOCUMENT/coursera/Getting And Cleaning Data/PROJECT/UCI HAR Dataset/test/X_test.txt"
  xtest<-read.csv(xtesturl)
  #GET TEST LABEL ie 1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS etc
  ytesturl<-"D:/MYDOCUMENT/coursera/Getting And Cleaning Data/PROJECT/UCI HAR Dataset/test/y_test.txt"
  ytest<-read.csv(ytesturl)
  
  #GET THE FEATURES WHICH CAME FROM 'accelerometer' AND 'gyroscope' ie tBodyAcc-XYZ, tGravityAcc-XYZ etc
  featureurl<-"D:/MYDOCUMENT/coursera/Getting And Cleaning Data/PROJECT/UCI HAR Dataset/features.txt"
  feature<-read.table(featureurl,header = FALSE)

  #COMBINE THE DATA BY USING RBIND FUNCTION
  Subject_data <- rbind(subjecttrain, subjecttest)
  Activity_data<- rbind(ytrain, ytest)
  Result_data<- rbind(xtrain, xtest)
  
  #SETTING RELEVANT NAMES TO COLUMNS
  names(Subject_data)<-c("subject")
  names(Activity_data)<- c("activity")  
  names(Result_data)<- feature$V2
  
  #COMBINE ALL THE COLUMNS FROM ALL DATA FRAMES INTO ONE SINGLE SET
  combined_data <- cbind(Subject_data, Activity_data)
  
  #QUESTION 1: Merges the training and the test sets to create one data set.
  One_Data_Set <- cbind(combined_data,Result_data)
  
  #EXTRACT THOSE COLUMNS WITH THAT CONTAINS MEAN() OR STR() TEXT
  selected_feature_col_name<-feature$V2[grep("mean\\(\\)|std\\(\\)", feature$V2)]
  
  #CREATE A VECTOR OF COLS WHICH CAN BE RETRIEVED LATER
  subsetColNames<-c(as.character(selected_feature_col_name), "subject", "activity" )
  
  #QUESTION 2: Extracts only the measurements on the mean and standard deviation for each measurement.
  Mean_SD_Only_Col_Data<-subset(One_Data_Set,select=subsetColNames)
  
  #QUESTION 3: Uses descriptive activity names to name the activities in the data set
  One_Data_Set$activity<-factor(One_Data_Set$activity,levels =c("1","2","3","4","5","6"),labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
  
  #REPLACE COLUMN WITH BETTER DESCRIPTIVE NAMES
  names(One_Data_Set)<-gsub("Acc", "Accelerometer_", names(One_Data_Set))
  names(One_Data_Set)<-gsub("Mag", "Magnitude_", names(One_Data_Set))
  names(One_Data_Set)<-gsub("Gyro", "Gyroscope_", names(One_Data_Set))
  names(One_Data_Set)<-gsub("^t", "time_", names(One_Data_Set))
  names(One_Data_Set)<-gsub("BodyBody", "Body_", names(One_Data_Set))
  names(One_Data_Set)<-gsub("^f", "frequency_", names(One_Data_Set))
  
  #CREATE SECOND INDEPENDENT DATA SET WITH AVERATE OF EACH ACTIVIY
  Second_Data_Set<-aggregate(. ~subject + activity, One_Data_Set, mean)
  Second_Data_Set<-Second_Data_Set[order(Second_Data_Set$subject,Second_Data_Set$activity),]
  write.table(Second_Data_Set, file = "tidydata.txt",row.name=FALSE)

}