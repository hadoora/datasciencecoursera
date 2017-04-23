# Getting & Cleaning Data
 
this script demonstrates collection, and cleaning of a data set, as well as creation of a tidy data set from pre-existing data.

how to run: all the data files are copied into the directory 
C:\Users\R\UCIHAR because the script looks for them in that directory. Once copy is done, all you need to do is source the script from within R using the command source('run_analysis.R').

The script will load the dplyr package, navigate to data directory, read in the X_test data set, read in the activity labels, rename the activity variables to more meaningful names, read in the names of the 561 measurement features and appropriately labels the X_test data set with descriptive variable names by mapping to the read-in 561 features.

After this, it creates and populates new variable by appending to it test subject data, following which it will create and populate new variable by appending to it test activity data, merge X-test data set with activity data to get descriptive activity names.

The next big step is to read and label the X_train data set, and
then merge the training and the test sets into one data set as instructed, next it extracts only the measurements on the mean and standard deviation for each measurement. This is done by performing a case-insensitive grep for all mean and std variables within the column names of the merged data set; then subsetting using these variables and the activity and subject variables.

Next it groups the extracted data by the activity and SubjectId in preparation for aggregation, then it will create independent tidy data set with the calculated average of all extracted variables grouped by activity and subject write out calculated tidy data set into reproducible txt format.
