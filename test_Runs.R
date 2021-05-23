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