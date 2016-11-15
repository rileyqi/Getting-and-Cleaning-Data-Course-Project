# CodeBook
## run_analysis.R
performs the 5 steps described in the course project's definition.<br />

1. Merges the training and the test sets to create one data set.<br />
2. Extracts only the measurements on the mean and standard deviation for each measurement.<br />
3. Uses descriptive activity names to name the activities in the data set<br />
4. Appropriately labels the data set with descriptive variable names.<br />
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br />

##Variables

* `feature_train`, `feature_train`, `subject_test`, `subject_test`, `activity_train` and `activity_test` contain the data downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* `feature`, `activity` and `subject` was the result data frame of merging previous data.
* `features.txt` is the list of all features which could be applied for the correct name of columns of `activity`
* `data` merges `feature`, `activity` and `subject` in a big dataset.
* 'subdata' extracts only the measurements on the mean and standard deviation for each measurement
* Finally, `tidy_data_set.tet` is the independent tidy data set with the average of each variable for each activity and each subject.
