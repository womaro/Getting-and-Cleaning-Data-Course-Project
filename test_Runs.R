loc <- "C:/Users/i0397027/OneDrive - Sanofi/Documents/R/RTestingJohnsHopkinsUni/CleaningDataProjectAssignement/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset/train/X_train.txt"

tempFileXTrain <- fread(loc, header = FALSE, sep = " ")

dim(tempFileXTrain)

loc2 <- "C:/Users/i0397027/OneDrive - Sanofi/Documents/R/RTestingJohnsHopkinsUni/CleaningDataProjectAssignement/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt"

tempFileXTrainX <- fread(loc2, header = FALSE, sep = " ")



dim(tempFileXTrainX)

locY <- "C:/Users/i0397027/OneDrive - Sanofi/Documents/R/RTestingJohnsHopkinsUni/CleaningDataProjectAssignement/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt"

tempFileXTrainY <- fread(locY, header = FALSE, sep = " ")
dim(tempFileXTrainY)


locZ <- "C:/Users/i0397027/OneDrive - Sanofi/Documents/R/RTestingJohnsHopkinsUni/CleaningDataProjectAssignement/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset/train/Inertial Signals/body_acc_Z_train.txt"

tempFileXTrainZ <- fread(locZ, header = FALSE, sep = " ")
dim(tempFileXTrainZ)

library(data.table)

install.packages("data.table")

locGZ <- "C:/Users/i0397027/OneDrive - Sanofi/Documents/R/RTestingJohnsHopkinsUni/CleaningDataProjectAssignement/Getting-and-Cleaning-Data-Course-Project/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"

tempFileXTrainGZ <- fread(locGZ, header = FALSE, sep = " ")
dim(tempFileXTrainGZ)

func <- function(x,y){
  return(x*y)
}

func(1,2)


meanstd <- grep("(.*?)mean\\(\\)(.*?)|(.*?)std\\(\\)(.*?)", names(tempTrainTest)[])

meanstd

TempMeanStd <- tempTrainTest[,1]

library(dplyr)

install.packages("dplyr")

TempMeanStd <- tempTrainTest %>% select(all_of(meanstd))

names(TempMeanStd)

head(tempTrainTest)

head(TempMeanStd)

for (i in nrow(tempAct)) {
  case_when( tempAct[i] == "1" ~ tempAct[i] <- "WALKING", 
             tempAct[i] == "2" ~ tempAct[i] <- "WALKING_UPSTAIRS",
             tempAct[i] == "3" ~ tempAct[i] <- "WALKING_DOWNSTAIRS",
             tempAct[i] == "4" ~ tempAct[i] <- "SITTING",
             tempAct[i] == "5" ~ tempAct[i] <- "STANDING",
             tempAct[i] == "6" ~ tempAct[i] <- "LAYING"
  )
}


tempAct <- tempAct %>% mutate(activitytype = case_when( activitytype == "1" ~ "WALKING", 
                                             activitytype == "2" ~ "WALKING_UPSTAIRS",
                                             activitytype == "3" ~ "WALKING_DOWNSTAIRS",
                                             activitytype == "4" ~ "SITTING",
                                             activitytype == "5" ~ "STANDING",
                                             activitytype == "6" ~ "LAYING"
))


tempAct[1]