##read in the files
subjecttest<- read.table("subject_test.txt", header=F)
xtest<-read.table("X_test.txt",header=F)
ytest<-read.table("y_test.txt",header=F)
subjecttrain<- read.table("subject_train.txt", header=F)
xtrain<-read.table("X_train.txt",header=F)
ytrain<-read.table("y_train.txt",header=F)


##label the columns in the data set
labels<-read.table("features.txt",header=F)
names(subjecttest)<-c("subjectnumber")
names(ytest)<-c("activity")
names(xtest) <- labels[,2] 
names(subjecttrain)<-c("subjectnumber")
names(ytrain)<-c("activity")
names(xtrain) <- labels[,2] 

##bind the columns to merge the data sets
bothtest<-cbind(subjecttest,ytest)
alltest<-cbind(bothtest,xtest)
bothtrain<-cbind(subjecttrain,ytrain)
alltrain<-cbind(bothtrain,xtrain)
complete<-rbind(alltest,alltrain)
complete2<-complete

##replace number codes with descriptive activity
c<-grep("1",complete2$activity)
complete2$activity <- replace(complete2$activity, c, "WALKING")
c<-grep("2",complete2$activity)
complete2$activity <- replace(complete2$activity, c, "WALKING_UPSTAIRS")
c<-grep("3",complete2$activity)
complete2$activity <- replace(complete2$activity, c, "WALKING_DOWNSTAIRS")
c<-grep("4",complete2$activity)
complete2$activity <- replace(complete2$activity, c, "SITTING")
c<-grep("5",complete2$activity)
complete2$activity <- replace(complete2$activity, c, "STANDING")
c<-grep("6",complete2$activity)
complete2$activity <- replace(complete2$activity, c, "LAYING")

##extracting only the measurements for mean and std
mm<-grep("mean",names(complete2)) 
ss<-grep("std",names(complete2))
sn<-grep("subjectnumber",names(complete2))
ac<-grep("activity",names(complete2))
stdmean<-c(sn,ac,mm,ss)
complete3<-complete2[,stdmean]

##create the 2nd tidy data set, with the average for each measurement
myTDS<-aggregate(complete3,list(complete3$subjectnumber,complete3$activity),mean)
myTDS<-myTDS[-3]
myTDS<-myTDS[-3]
colnames(myTDS)[1] <- "subjectnumber"
colnames(myTDS)[2] <- "activity"
write.table(myTDS,"myTDS.txt",row.name=FALSE)
 