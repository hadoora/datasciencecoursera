## this script demonstrates collection, and cleaning a data set.

## load the dplyr package for further use within the script.
library(dplyr)

## navigates to data directory
setwd('C:\\Users\\R\\UCIHAR')

## read in the X_test data set
a<-read.table(file='X_test.txt')

## read in the activity labels
b<-read.table(file='activity_labels.txt')

## rename the activity variables to more meaningful names
names(b)<-c('ActivityId','Activity')

## read in the names of the 561 measurement features
c<-read.table(file='features.txt')

## appropriately labels the X_test data set with descriptive variable names by
## mapping to the read-in 561 features
names(a)<-c[['V2']]

## create and populate new variable by appending to it test subject data
a$SubjectId<-as.numeric(unlist(read.table(file='subject_test.txt')))

## create and populate new variable by appending to it test activity data
a$ActivityId<-as.numeric(unlist(read.table(file='y_test.txt')))

## merge X-test data set with activity data to get descriptive activity names
a=merge(a,b)

## read in the X_train data set
d<-read.table(file='X_train.txt')

## appropriately labels the X_train data set with descriptive variable names by
## mapping to the read-in 561 features
names(d)<-c[['V2']]

## create and populate new variable by appending to it training subject data
d$SubjectId<-as.numeric(unlist(read.table(file='subject_train.txt')))

## create and populate new variable by appending to it test activity data
d$ActivityId<-as.numeric(unlist(read.table(file='y_train.txt')))

## merge X-train data set with activity data to get descriptive activity names
d=merge(d,b)

## merges the training and the test sets into one data set
a<-rbind(a,d)

## extracts only the measurements on the mean and standard deviation for each
## measurement. this is done by performing a case-insensitive grep for all mean 
## and std variables within the column names of the merged data set; then
## subsetting using these variables and the activity and subject variables.
d<-a[,c(564,563,grep('mean|std',tolower(names(a))))]

## group the extracted data by the activity and SubjectId in preparation for
## aggregation
e<-group_by(d,Activity,SubjectId)

## create independent tidy data set with the calculated average of all extracted
## variables grouped by activity and  subject
f<-summarize(e,mean1=mean(`tBodyAcc-mean()-X`),   mean2=mean(`tBodyAcc-mean()-Y`),   mean3=mean(`tBodyAcc-mean()-Z`),  mean4=mean(`tBodyAcc-std()-X`),   mean5=mean(`tBodyAcc-std()-Y`),  mean6=mean(`tBodyAcc-std()-Z`),   mean7=mean(`tGravityAcc-mean()-X`),   mean8=mean(`tGravityAcc-mean()-Y`),   mean9=mean(`tGravityAcc-mean()-Z`),   mean10=mean(`tGravityAcc-std()-X`),  mean11=mean(`tGravityAcc-std()-Y`),  mean12=mean(`tGravityAcc-std()-Z`),  mean13=mean(`tBodyAccJerk-mean()-X`),  mean14=mean(`tBodyAccJerk-mean()-Y`),  mean15=mean(`tBodyAccJerk-mean()-Z`),   mean16=mean(`tBodyAccJerk-std()-X`),   mean17=mean(`tBodyAccJerk-std()-Y`),   mean18=mean(`tBodyAccJerk-std()-Z`),   mean19=mean(`tBodyGyro-mean()-X`),  mean20=mean(`tBodyGyro-mean()-Y`),  mean21=mean(`tBodyGyro-mean()-Z`),  mean22=mean(`tBodyGyro-std()-X`),   mean23=mean(`tBodyGyro-std()-Y`),   mean24=mean(`tBodyGyro-std()-Z`),   mean25=mean(`tBodyGyroJerk-mean()-X`),    mean26=mean(`tBodyGyroJerk-mean()-Y`),   mean27=mean(`tBodyGyroJerk-mean()-Z`),  mean28=mean(`tBodyGyroJerk-std()-X`),  mean29=mean(`tBodyGyroJerk-std()-Y`),  mean30=mean(`tBodyGyroJerk-std()-Z`), mean31=mean(`tBodyAccMag-mean()`),  mean32=mean(`tBodyAccMag-std()`), mean33=mean(`tGravityAccMag-mean()`),  mean34=mean(`tGravityAccMag-std()`), mean35=mean(`tBodyAccJerkMag-mean()`),  mean36=mean(`tBodyAccJerkMag-std()`),  mean37=mean(`tBodyGyroMag-mean()`),  mean38=mean(`tBodyGyroMag-std()`),  mean39=mean(`tBodyGyroJerkMag-mean()`),   mean40=mean(`tBodyGyroJerkMag-std()`),  mean41=mean(`fBodyAcc-mean()-X`),   mean42=mean(`fBodyAcc-mean()-Y`),   mean43=mean(`fBodyAcc-mean()-Z`),   mean44=mean(`fBodyAcc-std()-X`),   mean45=mean(`fBodyAcc-std()-Y`),   mean46=mean(`fBodyAcc-std()-Z`),   mean47=mean(`fBodyAcc-meanFreq()-X`),  mean48=mean(`fBodyAcc-meanFreq()-Y`),   mean49=mean(`fBodyAcc-meanFreq()-Z`),   mean50=mean(`fBodyAccJerk-mean()-X`),   mean51=mean(`fBodyAccJerk-mean()-Y`),  mean52=mean(`fBodyAccJerk-mean()-Z`),   mean53=mean(`fBodyAccJerk-std()-X`),   mean54=mean(`fBodyAccJerk-std()-Y`),   mean55=mean(`fBodyAccJerk-std()-Z`),   mean56=mean(`fBodyAccJerk-meanFreq()-X`),   mean57=mean(`fBodyAccJerk-meanFreq()-Y`),  mean58=mean(`fBodyAccJerk-meanFreq()-Z`),   mean59=mean(`fBodyGyro-mean()-X`),  mean60=mean(`fBodyGyro-mean()-Y`),  mean61=mean(`fBodyGyro-mean()-Z`),  mean62=mean(`fBodyGyro-std()-X`),   mean63=mean(`fBodyGyro-std()-Y`),   mean64=mean(`fBodyGyro-std()-Z`),   mean65=mean(`fBodyGyro-meanFreq()-X`),   mean66=mean(`fBodyGyro-meanFreq()-Y`),   mean67=mean(`fBodyGyro-meanFreq()-Z`),   mean68=mean(`fBodyAccMag-mean()`),  mean69=mean(`fBodyAccMag-std()`),   mean70=mean(`fBodyAccMag-meanFreq()`),  mean71=mean(`fBodyBodyAccJerkMag-mean()`),  mean72=mean(`fBodyBodyAccJerkMag-std()`),    mean73=mean(`fBodyBodyAccJerkMag-meanFreq()`),   mean74=mean(`fBodyBodyGyroMag-mean()`),   mean75=mean(`fBodyBodyGyroMag-std()`),   mean76=mean(`fBodyBodyGyroMag-meanFreq()`),    mean77=mean(`fBodyBodyGyroJerkMag-mean()`),    mean78=mean(`fBodyBodyGyroJerkMag-std()`),   mean79=mean(`fBodyBodyGyroJerkMag-meanFreq()`),   mean80=mean(`angle(tBodyAccMean,gravity)`),  mean81=mean(`angle(tBodyAccJerkMean),gravityMean)`),   mean82=mean(`angle(tBodyGyroMean,gravityMean)`),     mean83=mean(`angle(tBodyGyroJerkMean,gravityMean)`), mean84=mean(`angle(X,gravityMean)`),   mean85=mean(`angle(Y,gravityMean)`),   mean86=mean(`angle(Z,gravityMean)`))

## write out calculated tidy data set into reproducible txt format
write.table(f,file='means.txt',row.name=FALSE)
