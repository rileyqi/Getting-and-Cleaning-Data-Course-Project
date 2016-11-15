list.files(recursive = T)
#1.Merges the training and the test sets to create one data set.
#read data
feature_train<-read.table("train/X_train.txt",header = F)
feature_test<-read.table("test/X_test.txt",header = F)
subject_train<-read.table("train/subject_train.txt",header = F)
subject_test<-read.table("test/subject_test.txt",header = F)
activity_train<-read.table("train/y_train.txt",header = F)
activity_test<-read.table("test/y_test.txt",header = F)
#combine each kind of data
feature<-rbind(feature_train,feature_test)
subject<-rbind(subject_train,subject_test)
activity<-rbind(activity_train,activity_test)
#rename columns
colnames(activity)<-c("activity")
colnames(subject)<-c("subject")
featurename<-read.table("features.txt",header = F)
colnames(feature)<-featurename$V2
#combine data to one data set
data<-cbind(activity,subject,feature)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
sub<-data[grep("mean\\(\\)|std\\(\\)",names(data))]
subdata<-cbind(activity,subject,sub)

#3.Uses descriptive activity names to name the activities in the data set.
activity_name<-read.table("activity_labels.txt",header = F)
subdata$activity <- activity_name[subdata$activity, 2]

#4.Appropriately labels the data set with descriptive variable names.
names(subdata)<-gsub("^t", "time", names(subdata))
names(subdata)<-gsub("^f", "frequency", names(subdata))
names(subdata)<-gsub("Acc", "Accelerometer", names(subdata))
names(subdata)<-gsub("Gyro", "Gyroscope", names(subdata))
names(subdata)<-gsub("Mag", "Magnitude", names(subdata))
names(subdata)<-gsub("BodyBody", "Body", names(subdata))

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
average<-aggregate(. ~subject + activity, subdata, mean)
write.table(average, file = "tidy_data_set.txt",row.name=FALSE)








