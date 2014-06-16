library(plyr)

# Appropriately labels the data set with descriptive variable names. 
xlab = read.table('UCI HAR Dataset/features.txt')
xlab = t(xlab)[2,]

x.test = read.table('UCI HAR Dataset/test/X_test.txt', col.names=xlab)
y.test = read.table('UCI HAR Dataset/test/y_test.txt', col.names='Activity')
sub.test = read.table('UCI HAR Dataset/test/subject_test.txt', col.names='Subject')

x.train = read.table('UCI HAR Dataset/train/X_train.txt', col.names=xlab)
y.train = read.table('UCI HAR Dataset/train/y_train.txt', col.names='Activity')
sub.train = read.table('UCI HAR Dataset/train/subject_train.txt', col.names='Subject')

# Extracts only the measurements on the mean and standard deviation for each measurement. 
x.test <- x.test[grep("(mean|std)\\.", colnames(x.test))]
x.train <- x.train[grep("(mean|std)\\.", colnames(x.train))]

# Merges the training and the test sets to create one data set.
df.test = cbind(sub.test, y.test, x.test)
df.train = cbind(sub.train, y.train, x.train)
df = rbind(df.test, df.train)

# Uses descriptive activity names to name the activities in the data set
df$Activity = revalue(as.factor(df$Activity), c(
  '1'='walking', 
  '2'='walking_up', 
  '3'='walking_down',
  '4'='sitting',
  '5'='standing',
  '6'='laying'))

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
df.new = ddply(df, .(Subject, Activity), numcolwise(mean))

write.csv(df.new, 'tidy.csv')