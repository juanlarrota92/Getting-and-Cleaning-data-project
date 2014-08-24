##Code Book
This file contains detailed information about the variables and transformations performed in the data set used in the project.
##Variable information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope to ccapture the required data.


Each record of the data set  contains the following information:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##Data sets
- README.txt

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

## Transformations performed
1. As soon as you set your working directory
2. Load the data  related to the training and test set into R.
3. Assign column names and merge both training and test set.
4. Extract the measurments related to the mean and standard deviation.
this can be done using the grep function in which you can get the indeces of the columns that has in their name either the mean or the standard deviation. then you can extract the columns that you need ( subjectId, activityId and the output od the grep function).
5. Use descriptive activity names to name the activities.This can be done by merging the data set by the Id row.
6. Modify the colnames in the data set to get clean and readable names.The function gsub was the method chosen to do this. here you can see an example of the transformartion fBodyBodyGyroJerkMag-std()  to tBodyGyroJerkMagStdev().
7. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
summarizing the dataset using the agrregate function was the method chosen.
8. The output of the previous step will be the final data set that will be exported to a text file.
