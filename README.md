# Getting-and-Cleaning-Data-Course-Project

Orginal data entry to this project is listed unnder below share. 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Following set of data transformation were performed in order to achive final result, that is finalSet data frame. 

Respective sections of script file are described with # $. "action title", where $ is in [1:9]. Important are sections starting from 2. 

Section 2 has a meaning of combining initial data sets (that were splited in two subsets: training and test) into one set. 
Section 3 is providing meaningfull names to the all collumns, using inital features files. 
Section 4 is resulting in selecting only a set off features, that are either mean or std from inital set of data. Arbitral decision was taken, to select columns, that contains mean() or std() in name. Here also, cleans up column names and additionaly change activity type column to factor class, and changing earlier numbers to descriptive names of activity, based on inital activity type file is done. 
Section 5 Here cleans up column names and additionaly change activity type column to factor class, and changing earlier numbers to descriptive names of activity, based on inital activity type file is done.
Section 6 Merging all previous temporary data sets to one, that will be base for furhter work
Section 7 Celean ups possible colums names, that does not follow agreed standard (should not have "_", "(" or ")")
Section 8 Builds new, final data set by calculating mean for all values grouped by activity type and subject. Final removal of additional "_mean" from resulting column names is done. 
Section 9 presents basis outcome of all previous activities