library('dplyr')

# load feature names
features <- read.csv('features.txt', sep="", header = FALSE)$V2
selected_cols <- grepl("mean|std", features)

# load activity names
activities <- as.vector(read.csv('activity_labels.txt', sep="", header = FALSE)$V2)

# dataset contains one, two or more spaces between columns, so set separator=""
fullset_x <- read.csv('train/X_train.txt', sep="", header = FALSE)
test_x <- read.csv('test/X_test.txt', sep="", header = FALSE)

# combine train x and test x
fullset_x <- rbind(fullset_x, test_x)

# set column names and select mean and std columns
colnames(fullset_x) <- features
fullset <- fullset_x[,selected_cols]

# load y and subject for both train and test sets
fullset_subject <- read.csv('train/subject_train.txt', sep="", header = FALSE)$V1
fullset_y <- read.csv('train/y_train.txt', sep="", header = FALSE)$V1

test_subject <- read.csv('test/subject_test.txt', sep="", header = FALSE)$V1
test_y <- read.csv('test/y_test.txt', sep="", header = FALSE)$V1

# combine subject and y of train and test
fullset_subject <- c(fullset_subject, test_subject)
fullset_y <- c(fullset_y, test_y)

# map y to activity names
fullset_y <- sapply(fullset_y, function(x) activities[x])

# add subject and y to full set of data
fullset$subject <- fullset_subject
fullset$activity <- fullset_y

# group by activity and subject
grouped <- group_by(fullset, subject, activity)

# summarise with mean for all columns
summarise_each(grouped, funs(mean))

