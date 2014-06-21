#The objective of this script is the following:
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 



#we also need to load some packages to convert some of our data
install.packages("car")
library(car)
install.packages("reshape2")
library(reshape2)
#Lets go to our directory with data and load the test data
# For a complete please see the code book and readme file
setwd('/vol08/coursera/greener/smart_phone_data/test')
Xtest <- read.table('X_test.txt', header = FALSE)
ytest <- read.table('y_test.txt', header = FALSE)
Xtestsubject <- read.table('subject_test.txt')
ytestrecoded  <- recode(ytest$V1,"1 = 'WALKING'; 2 = 'WALKING_UPSTAIRS'; 3 ='WALKING_DOWNSTAIRS'; 4 = 'SITTING'; 5 = 'STANDING';6 = 'LAYING'")
# load training data
setwd('/vol08/coursera/greener/smart_phone_data/train')
Xtrain <- read.table('X_train.txt', header = FALSE)
ytrain <- read.table('y_train.txt', header = FALSE)
Xtrainsubject <- read.table('subject_train.txt')
ytrainrecoded  <- recode(ytrain$V1,"1 = 'WALKING'; 2 = 'WALKING_UPSTAIRS'; 3 ='WALKING_DOWNSTAIRS'; 4 = 'SITTING'; 5 = 'STANDING';6 = 'LAYING'")
#load features data
features <- read.table('/vol08/coursera/greener/smart_phone_data/features.txt', sep=" ",header = FALSE)

# Our first task is to creat a tidy data set which means the following
#each variable forms a column
#each observation forms a row
# each table/file stores data about one kind of observation
# so we want subject, activity and all the body activity together as tidy data

#Lets add the appropriate colnames so we can properly merge the data together
colnames(Xtest) <- (features$V2)
colnames(Xtrain) <- (features$V2)
# Now lets create 2 data frames for test and train. I want subject_id, activity, body_activity

testsubjectactivity <- data.frame(subject=as.integer(Xtestsubject$V1),activity=as.character(ytestrecoded))

trainsubjectactivity <- data.frame(subject=as.integer(Xtrainsubject$V1),activity=as.character(ytrainrecoded))

testdata <- cbind(testsubjectactivity, Xtest)
traindata <- cbind(trainsubjectactivity, Xtrain)


#we no longer need this object and it take up a decent amount of space so I will remove it
rm(Xtrain)

#I know I could have used grep or something (like this:
#filtered_features <- grep(c("mean|std"), features$V2, #ignore.case=TRUE),but since our objective is just to extract the measurements I  just chose to select them here

measurements <- c("subject","activity","tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X","tBodyAcc-std()-Y","tBodyAcc-std()-Z","tGravityAcc-mean()-X","tGravityAcc-mean()-Y","tGravityAcc-mean()-Z","tGravityAcc-std()-X","tGravityAcc-std()-Y","tGravityAcc-std()-Z","tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z","tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z","tBodyGyro-mean()-X","tBodyGyro-mean()-Y","tBodyGyro-mean()-Z","tBodyGyro-std()-X","tBodyGyro-std()-Y","tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y","tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X","tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z","tBodyAccMag-mean()","tBodyAccMag-std()","tGravityAccMag-mean()","tGravityAccMag-std()","tBodyAccJerkMag-mean()","tBodyAccJerkMag-std()","tBodyGyroMag-mean()","tBodyGyroMag-std()","tBodyGyroJerkMag-mean()","tBodyGyroJerkMag-std()","fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z","fBodyAcc-std()-X","fBodyAcc-std()-Y","fBodyAcc-std()-Z","fBodyAccJerk-mean()-X","fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y","fBodyAccJerk-std()-Z","fBodyGyro-mean()-X","fBodyGyro-mean()-Y","fBodyGyro-mean()-Z","fBodyGyro-std()-X","fBodyGyro-std()-Y","fBodyGyro-std()-Z","fBodyAccMag-mean()","fBodyAccMag-std()","fBodyBodyAccJerkMag-mean()","fBodyBodyAccJerkMag-std()","fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()","fBodyBodyGyroJerkMag-std()")

testdatafiltered <- names(testdata) %in% measurements
traindatafiltered <- names(traindata) %in% measurements
testdata <- testdata[testdatafiltered]
traindata <- traindata[traindatafiltered]
#lets looks at the dimensions on these
dim(traindata)
dim(testdata)
# now we can properly  merge
mergedtesttrain <- merge(testdata, traindata, all=TRUE)

#Lets write our output to a tidy dataset from merge
write.csv(mergedtesttrain, file = "/vol08/coursera/greener/merged_testtrainandtidy.csv")
##############################################################################
#Creates a second, independent tidy data set with the average of each variable for each activity and each subject

#lets isolate all of the means values

avgmeasurescoordinates <- grep("mean", measurements, ignore.case=TRUE)

mergedtesttrainavg <- mergedtesttrain[,avgmeasurescoordinates]


#lets melt the data down to make it tidy
#I have chosen the data to be in a long format here

meansbysubjectmelt <- melt(mergedtesttrain, id=c("subject","activity"),measure.vars=names(mergedtesttrainavg))

# ok now lets break it up as the assignment describes  #independent tidy data set with the average of each variable for each activity and each subject.

meansbysubjectavgtidy <- aggregate(meansbysubjectmelt, by=list( meansbysubjectmelt$subject,meansbysubjectmelt$activity,meansbysubjectmelt$variable), data = meansbysubjectmelt, mean, na.rm=TRUE)


write.table(meansbysubjectavgtidy[,c(1:3,7)], "/vol08/coursera/greener/averageactivitybysubjecttidy.txt", sep="\t")



