#README

This file contains information about the processing of the Human Activity Recognition Using Smartphones dataset, that will be processed using the run_analysis.R file. 

##Reading in the Files, and combining the data sets

* subject_test.txt: The subject number(1-30) of the test data set
* subject_train.txt: the subject number(1-30) of the training data set
* X_test.txt: the accelerometer and gyroscope data of the test set
* X_train.txt: The accelerometer and gyroscope data of the training set
* y_test.txt: a number(1-6) corresponding to an activity in the test set
* y_train.txt: a number(1-6) correspondingto an activity in the training set

After the files were read in columns were labeled with the information provided in the features.txt file. The columns of subject test(the subject numbers) were bound to the corresponding y_test(activity), and then to the X_test data to create the test data set. The columns of subject_train, y_train and X_train were then bound together to create the training data set. These two data sets then had their rows combined to create one merged data set.

##Tidying and Extracting

The activity codes in the "activity" column were then replaced with the appropriate descriptive activity term(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
Only the columns containing names with "std" or "mean" were then extracted. The mean of the remaining variables was then taken and grouped using "aggregate". Two columns that became redundant after the grouping were removed, and the remaining data was writtten to  myTDS.txt







