get_proj_data <- function () {
 
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","projdata.zip")
    
    unzip("projdata.zip")
    
}