The output data represents the average values of various measurements collected from the accelerometers from the Samsung Galaxy S smartphone and grouped by Activity Type and Subject for which the experiment was conducted. The following variables can be found in the output data:
* Activity - The type of Activity the measurements was performed for. Possible values are "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
* Subject - An identifier of the subject who carried out the experiment
* 79 variables that represent the average values of various measurements. The name of a variable contains the signal name, the measurement type and optionally the direction name for the 3-axial signals. For example : "tBodyAcc.mean.Y" means "average value of the mean of "tBodyAcc" singal's Y direction" but "fBodyBodyGyroMag.std" means "average value of the standard deviation of "fBodyBodyGyroMag" value"

The steps performed to get the output data are:
* For both of the input train data(X_train.txt) and the test data(X_test.txt):
    - set the column names to the features names obtained from features.txt
    - leave only standard deviation and mean values of the measurements by excluding the columns that don't contain "mean" and "std" in the name
    - adding Activity column by using values obtained from y_train(or y_test).txt
    - replace Activity column values with the Activity Names obtained from activity_labels.txt
    - adding Subject column by using values obtained from subject_train(or subject_test).txt
* Merge the transformed train and test datasets to the single one
* Group merged dataset by Activity and Subject to show the average value for each measurement for each group 


