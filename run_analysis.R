# 1. Data file download section

src <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

dst <- "C:/Users/i0397027/OneDrive - Sanofi/Documents/R/RTestingJohnsHopkinsUni/CleaningDataProjectAssignement/Getting-and-Cleaning-Data-Course-Project/getdata_projectfiles_UCI_HAR_Dataset.zip"

ZIPrawDataFile <- download.file(src, dst)

library(utils)
library(data.table)
# 1. END

#2. Combined files of train and test data created
rawDataFiles <- unzip(dst, overwrite = TRUE)

locTrain <- "C:/Users/i0397027/OneDrive - Sanofi/Documents/R/RTestingJohnsHopkinsUni/CleaningDataProjectAssignement/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset/train/X_train.txt"
locTest  <- "C:/Users/i0397027/OneDrive - Sanofi/Documents/R/RTestingJohnsHopkinsUni/CleaningDataProjectAssignement/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset/test/X_test.txt"

tempTrain <- fread(locTrain, header = FALSE, sep = " ")
tempTest <- fread(locTest, header = FALSE, sep = " ")

tempTrainTest <- rbind(tempTrain, tempTest)
#2. END

#3. Assigning names to columns, as per feature.txt file

locNames <- "C:/Users/i0397027/OneDrive - Sanofi/Documents/R/RTestingJohnsHopkinsUni/CleaningDataProjectAssignement/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset/features.txt"

tempNames <- fread(locNames, header = FALSE)


names(tempTrainTest) <- unlist(tempNames[,2])
#3. END

