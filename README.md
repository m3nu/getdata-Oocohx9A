# Tidy HAR dataset

This script will take the original HAR sample set from [Smartlab](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and perform the following transformations:

1. Read file containing column names to correctly label each column.
2. Read original files from folders. Files should be unpacked for this. Datasets being read are the outcomes, the predictors and the corresponding subject.
3. The columns are filtered with a regular expression to only include mean and std for each variable.
4. The next step will merge test and training-data.
5. After this the Activity-column is converted to a factor and revalued to make it more readable.
6. The final operation groups the data by subject and activity and calculated the mean for each of them.

For more details, please refer to the comments in the script directly.