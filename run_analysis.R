# 0. Intro
library(utils)
library(data.table)
library(dplyr)
# 0. END

# 1. Data file download section

if(Sys.info()['sysname']=="Windows")
{
  root<- "C:/TempData"
} else if(Sys.info()['sysname']=="Linux") {
  root<- "/home/Data"
} else if(Sys.info()['sysname']=="OS") {
    root <- "./data"
  }

if(!file.exists(root)){dir.create(root)}

src <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dst <- paste(root,"/getdata_projectfiles_UCI_HAR_Dataset.zip", sep="")

ZIPrawDataFile <- download.file(src, dst)
unzip(dst, overwrite = TRUE)
# 1. END

#2. Combined files of train and test data created

locTrain <- paste(root, "/UCI HAR Dataset/train/X_train.txt", sep="")
locTest  <-  paste(root, "/UCI HAR Dataset/test/X_test.txt", sep="")

tempTrain <- fread(locTrain, header = FALSE, sep = " ") 
tempTest <- fread(locTest, header = FALSE, sep = " ")

tempTrainTest <- rbind(tempTrain, tempTest)
#2. END

#3. Assigning names to columns, as per feature.txt file, all names in small letters

locNames <- paste(root, "/UCI HAR Dataset/features.txt", sep="")

tempNames <- fread(locNames, header = FALSE)

names(tempTrainTest) <- tolower(unlist(tempNames[,2]))
# 3. END

# 4. Selection of mean() and std() data only

meanstd <- grep("(.*?)mean\\(\\)(.*?)|(.*?)std\\(\\)(.*?)", names(tempTrainTest)[]) # vector of column names, that contains either mean() or std() in name

tempTrainTest <- tempTrainTest %>% select(all_of(meanstd)) # selection of subset of data, that contains mean() or std()
# 4. END

# 5. Adding activities labels and factoring labels, adding Subject and name for its column

locTrainAct <- paste(root, "/UCI HAR Dataset/train/y_train.txt", sep="")
locTestAct  <- paste(root, "/UCI HAR Dataset/test/y_test.txt", sep="")

tempTrainAct <- fread(locTrainAct, header = FALSE, sep = " ")
tempTestAct <- fread(locTestAct, header = FALSE, sep = " ")

tempAct <- rbind(tempTrainAct, tempTestAct) #rm(tempAct)

names(tempAct) <- "activitytype"

tempAct$activitytype <- as.factor(tempAct$activityty)

tempAct <- tempAct %>% mutate(activitytype = case_when( activitytype == "1" ~ "WALKING", 
                                                        activitytype == "2" ~ "WALKING_UPSTAIRS",
                                                        activitytype == "3" ~ "WALKING_DOWNSTAIRS",
                                                        activitytype == "4" ~ "SITTING",
                                                        activitytype == "5" ~ "STANDING",
                                                        activitytype == "6" ~ "LAYING"
))

locTrainSubject <- paste(root, "/UCI HAR Dataset/train/subject_train.txt", sep="")
tempTestSubject <- paste(root, "/UCI HAR Dataset/test/subject_test.txt", sep="")

tempTrainSubject <- fread(locTrainSubject, header = FALSE, sep = " ")
tempTestSubject <- fread(tempTestSubject, header = FALSE, sep = " ")

tempSubject <- rbind(tempTrainSubject, tempTestSubject)

names(tempSubject) <- "subject"

# 6. Combining features, activity and subject tables

tempTrainTest <- cbind(tempTrainTest, tempAct, tempSubject)

# 6. END

# 7. Basic features names changes, as per best practices and other columns names clean up

names(tempTrainAct) <- tolower(names(tempTrainAct)) # if exist, change all CAPITALs to lower in names

names(tempTrainTest) <- gsub("-", "", names(tempTrainTest))
names(tempTrainTest) <- gsub("\\(", "", names(tempTrainTest))
names(tempTrainTest) <- gsub("\\)", "", names(tempTrainTest))

# 7. END

# 8. Calculating mean for all features grouped by subject and activity type, slight modification of resluting column names

finalSet <- tempTrainTest %>% group_by(activitytype, subject) %>%  summarise(across(everything(), list(mean)))

names(finalSet) <- gsub("_1", "mean", names(finalSet))

# 8. END

# 9. Final look on finalSet containig resulting data

names(finalSet)
head(finalSet, 20)

# 9. END

