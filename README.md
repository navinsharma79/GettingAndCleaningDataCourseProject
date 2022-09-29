**Overview**

This is a readme for the Getting and Cleaning Data Coursera course. The
project takes several tables created from an experiment to create a
summarized data set.

**Description of original experiment**

==================================================================

Human Activity Recognition Using Smartphones Dataset

Version 1.0

==================================================================

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

<activityrecognition@smartlab.ws>

www.smartlab.ws

==================================================================

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain. See
‘features\_info.txt’ for more details.

**Data sets used**

The following data sets were used from the original project

-   features.txt: List of all features
-   activity\_labels.txt: Links the class labels with their activity
    name.
-   X\_train.txt: Training set.
-   y\_train.txt: Training labels.
-   X\_test.txt: Test set.
-   y\_test.txt: Test labels.
-   subject\_train.txt’: Each row identifies the subject who performed
    the activity for each window sample. Its range is from 1 to 30
-   subject\_test.txt’: Each row identifies the subject who performed
    the activity for each window sample. Its range is from 1 to 30

**Merging all the data**

The following R code merged the data together

    train <- cbind(trainSubjects,trainActivityLabels,trainActivitySet)
    test <- cbind(testSubjects,testActivityLabels,testActivitySet)
    rawData <- rbind(train,test)
    rawData <- rawData %>% mutate(Activity=activities[Activity,2])

The first two lines combined the train / test data into one data table
by column binding the three loaded data sets

The third line combined the train and test data into one table by row
binding the test data below the train data

The fourth line replaced the activity codes with the activity names

**Filtering the combined data set**

The combined data set included features that were not to be used in this
project. So the following code was written to cull the data to only
include the mean and std readings. It also cleaned up the variable names

    featureInclude <- filter(features,grepl("mean\\(\\)|std\\(\\)",features$V2))
    filteredData <- rawData[,c(1,2,featureInclude[,1]+2)]

    colnames(filteredData) <- gsub("\\.","",colnames(filteredData))
    colnames(filteredData) <- gsub("\\.","",colnames(filteredData))
    colnames(filteredData) <- gsub("mean","Mean",colnames(filteredData))
    colnames(filteredData) <- gsub("std","Std",colnames(filteredData))

The first line filtered all the mean and standard deviation features
from the full feature list and put it in a vector

The second line used this vector to filter the full data set while also
preserving the Subject and Activity variables (the 1 and 2 columns)

The rest of the code used the gsub function to clean up the naming.

**Creating a tidy data set**

At this point I had a table with the just the variables needed. However,
I wanted a long tidy data set. Specifically I wanted the column names
for the features to be data elements in one variable I called feature. I
used the tidyr package (similar to the swirl lesson) to do this.

    tidyData <- gather(filteredData,"Feature","Value",colnames(filteredData[,3:ncol(filteredData)]))

This line puts all the column names for the features into data elements
for a variable I named Feature and puts the values into a variable I
named Value.

Here are the first few lines of the tidy data set I created.

    head(tidyData)

    ##   Subject Activity       Feature     Value
    ## 1       1 STANDING tBodyAccMeanX 0.2885845
    ## 2       1 STANDING tBodyAccMeanX 0.2784188
    ## 3       1 STANDING tBodyAccMeanX 0.2796531
    ## 4       1 STANDING tBodyAccMeanX 0.2791739
    ## 5       1 STANDING tBodyAccMeanX 0.2766288
    ## 6       1 STANDING tBodyAccMeanX 0.2771988

**Summarizing the data**

The last step is to summarize the data by taking a mean across each
Subject, Activity, Feature set of observations.

    groupedData <- group_by(tidyData,Subject,Activity,Feature)
    summarizedData <- summarize(groupedData,Mean=mean(Value))

I grouped by the Subject, Activity, and Feature variables in the first
line. The second line then summarized using the mean function.

Here are the first few lines of the summarized table. This table was
submitted for the assignment

    head(summarizedData)

    ## # A tibble: 6 × 4
    ## # Groups:   Subject, Activity [1]
    ##   Subject Activity Feature             Mean
    ##     <int> <chr>    <chr>              <dbl>
    ## 1       1 LAYING   fBodyAccJerkMeanX -0.957
    ## 2       1 LAYING   fBodyAccJerkMeanY -0.922
    ## 3       1 LAYING   fBodyAccJerkMeanZ -0.948
    ## 4       1 LAYING   fBodyAccJerkStdX  -0.964
    ## 5       1 LAYING   fBodyAccJerkStdY  -0.932
    ## 6       1 LAYING   fBodyAccJerkStdZ  -0.961
