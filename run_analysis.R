library(dplyr)

run_analysis <- function () {
    
    #Get the column names from the features.txt file.
    mynames<-read.table("UCI HAR Dataset/features.txt")
    
    #Get the activity labels
    myacts<-read.table("UCI HAR Dataset/activity_labels.txt")
    myacts<-rename(myacts,Activity=V2)
    
    #Read in the test Data with descriptive column names.
    mytestdata   <-read.table("UCI HAR Dataset/test/X_test.txt",  col.names = mynames$V2)
    
    #Get test labels and add a column of descriptive activity names.
    mytestlabels <-read.table("UCI HAR Dataset/test/y_test.txt")
    mytestlabels<-left_join(mytestlabels,myacts)
    
    #Add column to test data with the descriptive activity labels.
    mytestdata<- cbind(mytestdata,mytestlabels$Activity)
    mytestdata<- rename(mytestdata,Activity=`mytestlabels$Activity`)
    
    #Read in the train data with descriptive column names.
    mytraindata   <-read.table("UCI HAR Dataset/train/X_train.txt",col.names = mynames$V2)
    
    #Get train labels and add a column of descriptive activity names.
    mytrainlabels <-read.table("UCI HAR Dataset/train/y_train.txt")
    mytrainlabels<-left_join(mytrainlabels,myacts)
   
    #Add column to test data with the descriptive activity labels.
    mytraindata<- cbind(mytraindata,mytrainlabels$Activity)
    mytraindata<- rename(mytraindata,Activity=`mytrainlabels$Activity`)
    
    
     
    #Combine test and train into one dataset.
    mydata<-rbind(mytestdata,mytraindata)
    
    #Extract only the means and standard deviations
    mymsdata<-select(mydata,grep("std|mean|Activity",names(mydata)))
    

    
}