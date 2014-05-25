run_analysis <- function(sour_dir="./",dest_dir="./",save_to_file=F){

	## Check if library data.table is installed. If not, data.table will be installed.
	if (!"data.table" %in% installed.packages()) install.packages("data.table")
	library(data.table)

	## Check if all files are available. If not, files will be downloaded to temporary variable.
	if(9<sum(file.exists(
		paste(sour_dir,"test/y_test.txt",sep=""),paste(sour_dir,"test/y_test.txt",sep=""),paste(sour_dir,"test/X_test.txt",sep=""),paste(sour_dir,"train/y_train.txt",sep=""),paste(sour_dir,
		"train/x_train.txt",sep=""),paste(sour_dir,"test/subject_test.txt",sep=""),paste(sour_dir,"train/subject_train.txt",sep=""),paste(sour_dir,"features.txt",sep=""),paste(sour_dir,"activity_labels.txt",sep="")
		))) {
		### Downloading zfp to temp variable.
		temp <- tempfile()
		fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
		d<-download.file(fileUrl, destfile = temp, method = "curl")
		### Reading data from files inside zip file.
		y_test<-read.table(unz(temp,"UCI HAR Dataset/test/y_test.txt"))
		y_test<-read.table(unz(temp,"UCI HAR Dataset/test/y_test.txt"))
		x_test<-read.table(unz(temp,"UCI HAR Dataset/test/X_test.txt"))
		y_train<-read.table(unz(temp,"UCI HAR Dataset/train/y_train.txt"))
		x_train<-read.table(unz(temp,"UCI HAR Dataset/train/X_train.txt"))
		subject_test<-read.table(unz(temp,"UCI HAR Dataset/test/subject_test.txt"))
		subject_train<-read.table(unz(temp,"UCI HAR Dataset/train/subject_train.txt"))
		features<-read.table(unz(temp,"UCI HAR Dataset/features.txt"))
		activity_labels<-read.table(unz(temp,"UCI HAR Dataset/activity_labels.txt"))

		unlink(temp)


	} else {
		y_test<-read.table(paste(sour_dir,"test/y_test.txt",sep=""))
		x_test<-read.table(paste(sour_dir,"test/X_test.txt",sep=""))
		y_train<-read.table(paste(sour_dir,"train/y_train.txt",sep=""))
		x_train<-read.table(paste(sour_dir,"train/X_train.txt",sep=""))
		subject_test<-read.table(paste(sour_dir,"test/subject_test.txt",sep=""))
		subject_train<-read.table(paste(sour_dir,"train/subject_train.txt",sep=""))
		features<-read.table(paste(sour_dir,"features.txt",sep=""))
		activity_labels<-read.table(paste(sour_dir,"activity_labels.txt",sep=""))
	}

	## Preparing "Y" data from y_train and y_test.
	### Connect y_train and y_test together.
	y<-rbind(y_test,y_train)
	### Add row for sorting after merge with names of activity.
	y$idrow  <- 1:nrow(y)
	### Add columns names.
	names(y)<-"idactivity"
	names(activity_labels)<-c("idactivity","activity")
	### Merge Y with names of activity
	ymerge<-merge(y,activity_labels,by.x="idactivity",by.y="idactivity",sort=F)
	### Sort merged data to original sorting by added idrow.
	ymergeordered<-ymerge[order(ymerge[2]),]
	datay<-ymergeordered[3]

	## Preparing "subject" data from subject_test and subject_train.
	subject<-rbind(subject_test,subject_train)
	names(subject)<-"subject"

	## Preparing "X" data from x_test and x_train.
	### Connect y_train and y_test together.
	x<-rbind(x_test,x_train)
	### Prepare English-like descriptive names of columns
	#### all letters are small 
	a<-tolower(features[,2])
	#### all names are without characters "[-(),]" 
	b<-gsub("[-(),]","",a)
	names(x)<-b
	### Extracts only the measurements on the mean and standard deviation for each measurement. (only columns with std or mean included in name)
	c<-grep("std|mean",b)
	datax<-x[,c]

	## One dataset from Y, X, activity and subject files 
	data<-as.data.table(cbind(datax,datay,subject))

	if (save_to_file){
		## Saving results
		if (!file.exists(dest_dir)) {
		    	dir.create(dest_dir)
			}
		### Saving complete merge data.
		write.table(data,paste(dest_dir,"comletedata.txt",sep=""))
		print(paste("Complete data saved to ",dest_dir,"comletedata.txt",sep=""))
		finaldata<-data[, lapply(.SD,mean), by = "activity,subject"]
		finaldata<-finaldata[order(finaldata[2]),]
		### Saving data set with the average of each variable for each activity and each subject.
		write.table(finaldata[order(activity,subject)],paste(dest_dir,"finaldata.txt",sep=""))
		print(paste("Complete data saved to ",dest_dir,"finaldata.txt",sep=""))
	}	
	return(finaldata[order(activity,subject)])
}




