> This book descibes  all of my data, showing the names of each variable, the values the variable takes, and a complete description of how that variable is operationalized.
 
>Xtest : a list (type double) containing our Test set .

>ytest : a list (type integer) containing our Test labels


>Xtestsubject : This is a list containing the individual subject names. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

>ytestrecoded : a list containing the revised y test data no longer numbers, these have been converted to real activity recordings. These values were based on the original activity labels file that was written into the run analysis script.  These are:  'WALKING'; 2 = 'WALKING_UPSTAIRS'; 3 ='WALKING_DOWNSTAIRS'; 4 = 'SITTING'; 5 = 'STANDING';6 = 'LAYING'")


> Training data
>Xtrain : a list containing our Training set.
>ytrain : a list containing our  Training labels.

>Xtrainsubject : This is a list (integer) containing the individual subject names. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

>ytrainrecoded  'WALKING'; 2 = 'WALKING_UPSTAIRS'; 3 ='WALKING_DOWNSTAIRS'; 4 = 'SITTING'; 5 = 'STANDING';6 = 'LAYING'")

> feature data
features : a character list of all the feature names. These will be used in my run analysis script to properly add the appropriate colnames. The reason ehy this is important is so we can properly merge the two test and training data sets together


> The following variables below are used in the process of  creating a tidy data set which means the following: 
>each variable forms a column
>each observation forms a row
> each table/file stores data about one kind of observation
> so we want subject, activity and all the body activity together as tidy data


>testsubjectactivity : a data frame containing subjects (integer) and activity as a character.


>trainsubjectactivity a data frame containing subjects (integer) and activity as a character.

>testdata : A list combination of the testsubjectactivity data frame and Test data 

>traindata : A list combination of the trainsubjectactivity data frame and Train data 



>measurements : this is a complete listing of all the avrages and standard deviations from the human activity data set

>testdatafiltered: The coordinates of the test data set filtered by average and std measurements

>traindatafiltered: The coordinates of the train data set filtered by average and std measurements


>testdata : updated test data to only include data filtered by by average and std measurements

>traindata : updated train data to only include data filtered by by average and std measurements


>mergedtesttrain : The merged test and train data sets into one data 


>Creates a second, independent tidy data set with the average of each variable for each activity and each subject

> meansbysubjectmelt : a melted data frame based on the means , subject and activity 

>meansbysubjectavgtidy :using the aggregrate function I create an independent tidy data set with the average of each variable for each activity and each subject.

