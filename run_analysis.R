features <- read.table('features.txt')
features.names <- features[,2]
features.names <- gsub('-', '.', features.names)
features.names <- gsub('\\(\\)', '', features.names)
activities <- read.table('activity_labels.txt')
activities[,1] <- as.factor(activities[,1])
activities[,2] <- as.character(activities[,2])

# builds the data from the measurements set, the labels and the subject
# using number of steps annotaited in the function comments.
build.data <- function(data.set.path, data.labels.path, data.subjects.path){  
  data <- read.table(data.set.path)
  
  # step#1 - extracting columns names from the features list
  colnames(data) <- features.names
  
  # step#2 - leaving only the measurements on the mean and standard deviation for each measurement. 
  data <- data[,grep('mean()|std()', colnames(data))]  
  
  # step#3 - adding 'Activity' column end the end of the data 
  data.labels <- read.table(data.labels.path)
  data$Activity <- data.labels[,1]
  
  # step#4 - replacing activityId with the activity name
  for(activityId in levels(activities[,1])){
    #print(activities[activities[,1]==activityId, 2])
    data[data$Activity==as.character(activityId), 'Activity'] <- activities[activities[,1]==activityId, 2]
  }
  data$Activity <- as.factor(data$Activity)
  
  # step#5 - adding 'Subject' column at the end of the data
  data.subjects <- read.table(data.subjects.path)
  data$Subject <- as.factor(data.subjects[,1])
  return(data)
}

test <- build.data('test/X_test.txt', 'test/y_test.txt', 'test/subject_test.txt')
train <- build.data('train/X_train.txt', 'train/y_train.txt', 'train/subject_train.txt')
all.data <- rbind(test, train)