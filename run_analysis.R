library(dplyr)

run_analysis <- function () {
    
    #Get the column names from the features.txt file.
    mynames<-read.table("UCI HAR Dataset/features.txt")
    
    #Read in the test Data with descriptive column names.
    mytestdata <-read.table("UCI HAR Dataset/test/X_test.txt",  col.names = mynames$V2)
    
    #Read in the train data with descriptive column names.
    mytraindata<-read.table("UCI HAR Dataset/train/X_train.txt",col.names = mynames$V2)
    
    #Combine test and train into one dataset.
    mydata<-rbind(mytestdata,mytraindata)
    
    
    
}