# Run analysis script

The script starts by reading "features.txt" which contains the column names for the variables in train and test set.
From the features it creates a logical vector which has TRUE value for all the variables we are interested in. The interesting
variables are the ones which have either "mean" or "std" in their name.

Next the activity names are loaded from "activity_labels.txt" and stored to a vector. The vector at certain index maps the
numeric values in "y_train.txt" and "y_test.txt" to factor value.

After loading the metadata the variables are loaded from "X_train.txt" and "X_test.txt". After loading these are catenated to
form one dataset. These files have variable number of spaces between columns which is why sep="" parameter is given.

The full dataset is then given column names from the "features.txt" loaded earlier. Also the uninteresting columns are removed
with the help of the logical vector created from the variable names.

Next the script loads the activity information and subject information from both train and test sets. These are then catenated
together. The activities are mapped from numeric to factor values with the help of the vector created earlier from the
"activity_labels.txt".

Finally the subject and activity information is combined with the full dataset and dataset is then outputted.
