library(dplyr)

#run_analysis <- function () {
    
    #Get the column names from the features.txt file.
    mynames<-read.table("UCI HAR Dataset/features.txt")
    
    #Get the activity labels
    myacts<-read.table("UCI HAR Dataset/activity_labels.txt")
    
    
    
    #Read in the test Data with descriptive column names.
    mytestdata   <-read.table("UCI HAR Dataset/test/X_test.txt",  col.names = mynames$V2)
    
    #Get test labels and add a column of descriptive activity names.
    mytestlabels <-read.table("UCI HAR Dataset/test/y_test.txt")
    mytestlabels<-left_join(mytestlabels,myacts)
    
    #Add column to test data with the descriptive activity labels.
    mytestdata<- cbind(mytestdata,mytestlabels$V2)
    mytestdata<- rename(mytestdata,Activity=`mytestlabels$V2`)
    
    #Get test subjects .
    mytestsubjects <-read.table("UCI HAR Dataset/test/subject_test.txt")
    
    #Add column to test data with the descriptive activity labels.
    mytestdata<- cbind(mytestdata,mytestsubjects)
    mytestdata<- rename(mytestdata,Subject=V1)
    
    
    
    
    #Read in the train data with descriptive column names.
    mytraindata   <-read.table("UCI HAR Dataset/train/X_train.txt",col.names = mynames$V2)
    
    #Get train labels and add a column of descriptive activity names.
    mytrainlabels <-read.table("UCI HAR Dataset/train/y_train.txt")
    mytrainlabels<-left_join(mytrainlabels,myacts)
   
    #Add column to test data with the descriptive activity labels.
    mytraindata<- cbind(mytraindata,mytrainlabels$V2)
    mytraindata<- rename(mytraindata,Activity=`mytrainlabels$V2`)
    
    #Get train subjects .
    mytrainsubjects <-read.table("UCI HAR Dataset/train/subject_train.txt")
    
    #Add column to test data with the descriptive activity labels.
    mytraindata<- cbind(mytraindata,mytrainsubjects)
    mytraindata<- rename(mytraindata,Subject=V1)
    
    
    
    
    #Combine test and train into one dataset.
    mydata<-rbind(mytestdata,mytraindata)
    
    #Extract only the means and standard deviations
    mymsdata<-select(mydata,grep("std|mean|Activity|Subject",names(mydata)))
    
    
    
    
    #Create a new data frame with the same headers, but empty
    mymsdata_avgvals<-filter(mymsdata,Activity=="Skipping")
    
    #For each combination of an activity and subject...
    for (act in myacts$V2){
        for (subj in 1:30){
            #Get the data associated with that activity & subject
            mysubset<-filter(mymsdata,Activity==act,Subject==subj)
            #Remove the Activity and Subject columns
            mysubset_num<-select(mysubset,-Activity,-Subject)
            #Get the averages oof all the columns
            mysubsetmeans<-colMeans(mysubset_num)
            #Turn the resulting named numeric vector back into a data.frame and reattach Activity and Subject columns
            mysubsetmeans<-mutate(data.frame(as.list(mysubsetmeans)),Activity=act,Subject=subj)
            #Use rbind to attach this row to the mymsdata_avgvals data frame.
            mymsdata_avgvals<-rbind(mymsdata_avgvals,mysubsetmeans)
        }
    }
    
    

    
#}