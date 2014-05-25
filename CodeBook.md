##Code book for Getting and Cleaning Data Course Project

###Introduction
This code book describes the variables, the data, and transformations that script performed to clean up the data.

###Data input
Data are reading from local directory or url source. Url source would use when the local data was unavailable.
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
<pre><code>
y<-rbind(y_test,y_train)
x<-rbind(x_test,x_train)
subject<-rbind(subject_test,subject_train)
</code></pre>






###Sources:
- Source data are from url "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
- Full description are on "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones".
- Files description is on https://github.com/bierza/GettingandCleaningDataCourseProject/blob/master/description_of_data_source
