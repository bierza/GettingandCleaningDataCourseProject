##Code book for Getting and Cleaning Data Course Project

###Introduction
This code book describes the variables, the data, and transformations that script performed to clean up the data.

###Data input
Data are read from local directory or url source. Url source would use when the local data was unavailable.
**Script read 9 files:**
- y_test.txt - File contains test labels of data. 
- X_test.txt - File contains test set of data.
- y_train.txt - File contains training labels of data. 
- x_train.txt - File contains training set of data.
- subject_test.txt - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- subject_train.txt - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- features.txt - List of all features.
- activity_labels.txt - Links the class labels with their activity name.

###Transformation
1. Testing and training data are join together.
<pre><code>y<-rbind(y_test,y_train)
x<-rbind(x_test,x_train)
subject<-rbind(subject_test,subject_train)</code></pre>
2. Prepare English-like descriptive names of columns. The names of all letters are  small. The names are without symbol like "[-(),]"
<pre><code>#### all letters are small 
a<-tolower(features[,2])
#### all names are without characters "[-(),]" 
b<-gsub("[-(),]","",a)
names(x)<-b</code></pre>
3. Add descriptive name of column of subject data.
<pre><code>names(subject)<-"subject"</code></pre>
4. Extracts only the measurements on the mean and standard deviation for each measurement. (only columns with std or mean included in name)
<pre><code>c<-grep("std|mean",b)
datax<-x[,c]</code></pre>
5. Replace numbers from y_train and y_test by words from activity_labels file.
<pre><code>### Add row for sorting after merge with names of activity.
y$idrow  <- 1:nrow(y)
### Add columns names.
names(y)<-"idactivity"
names(activity_labels)<-c("idactivity","activity")
### Merge Y with names of activity
ymerge<-merge(y,activity_labels,by.x="idactivity",by.y="idactivity",sort=F)
### Sort merged data to original sorting by added idrow.
ymergeordered<-ymerge[order(ymerge[2]),]
datay<-ymergeordered[3]</code></pre>





###Sources:
- Source data are from url "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
- Full description are on "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones".
- Files description is on https://github.com/bierza/GettingandCleaningDataCourseProject/blob/master/description_of_data_source
