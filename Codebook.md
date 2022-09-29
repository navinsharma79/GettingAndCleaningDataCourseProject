## R Markdown

This is the code book for the course project for the *Gathering and
Cleaning Data* Coursera class.

The project takes data from experiments performed by the following group
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory DITEN - Università
degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy.
<activityrecognition@smartlab.ws> www.smartlab.ws

In the experiment, a group of 30 volunteers within an age bracket of
19-48 years performed six activities (WALKING, WALKING\_UPSTAIRS,
WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone
(Samsung Galaxy S II) on the waist.

Using its embedded accelerometer and gyroscope, the researchers captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz.

The course project was to take the raw data which was in several tables,
merge them together into one table, tidy that data, and then summarize
specific variables via the mean() function.

The data in the final summarized table are described below.

**Subject**

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years.

This variable is an integer representing the subject number performing
an activity

    unique(summarizedData$Subject)

    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
    ## [26] 26 27 28 29 30

**Activity**

Each person performed six activities (WALKING, WALKING\_UPSTAIRS,
WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone
(Samsung Galaxy S II) on the waist.

This variable is a string representing the activity being performed

    unique(summarizedData$Activity)

    ## [1] "LAYING"             "SITTING"            "STANDING"          
    ## [4] "WALKING"            "WALKING_DOWNSTAIRS" "WALKING_UPSTAIRS"

**Feature**

The section below describes how the features were measured by the
research team.

*The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix ‘t’ to denote time) were captured at a constant rate of
50 Hz. Then they were filtered using a median filter and a 3rd order low
pass Butterworth filter with a corner frequency of 20 Hz to remove
noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3
Hz.*

*Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).*

*Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to
indicate frequency domain signals).*

*These signals were used to estimate variables of the feature vector for
each pattern: * *‘-XYZ’ is used to denote 3-axial signals in the X, Y
and Z directions.*

The set of variables that were estimated from these signals and included
in this project are mean(): Mean value std(): Standard deviation

The variables are a string with the following format Feature name + mean
/ std + X/Y/Z

The complete list of variables is below

    unique(summarizedData$Feature)

    ##  [1] "fBodyAccJerkMeanX"        "fBodyAccJerkMeanY"       
    ##  [3] "fBodyAccJerkMeanZ"        "fBodyAccJerkStdX"        
    ##  [5] "fBodyAccJerkStdY"         "fBodyAccJerkStdZ"        
    ##  [7] "fBodyAccMagMean"          "fBodyAccMagStd"          
    ##  [9] "fBodyAccMeanX"            "fBodyAccMeanY"           
    ## [11] "fBodyAccMeanZ"            "fBodyAccStdX"            
    ## [13] "fBodyAccStdY"             "fBodyAccStdZ"            
    ## [15] "fBodyBodyAccJerkMagMean"  "fBodyBodyAccJerkMagStd"  
    ## [17] "fBodyBodyGyroJerkMagMean" "fBodyBodyGyroJerkMagStd" 
    ## [19] "fBodyBodyGyroMagMean"     "fBodyBodyGyroMagStd"     
    ## [21] "fBodyGyroMeanX"           "fBodyGyroMeanY"          
    ## [23] "fBodyGyroMeanZ"           "fBodyGyroStdX"           
    ## [25] "fBodyGyroStdY"            "fBodyGyroStdZ"           
    ## [27] "tBodyAccJerkMagMean"      "tBodyAccJerkMagStd"      
    ## [29] "tBodyAccJerkMeanX"        "tBodyAccJerkMeanY"       
    ## [31] "tBodyAccJerkMeanZ"        "tBodyAccJerkStdX"        
    ## [33] "tBodyAccJerkStdY"         "tBodyAccJerkStdZ"        
    ## [35] "tBodyAccMagMean"          "tBodyAccMagStd"          
    ## [37] "tBodyAccMeanX"            "tBodyAccMeanY"           
    ## [39] "tBodyAccMeanZ"            "tBodyAccStdX"            
    ## [41] "tBodyAccStdY"             "tBodyAccStdZ"            
    ## [43] "tBodyGyroJerkMagMean"     "tBodyGyroJerkMagStd"     
    ## [45] "tBodyGyroJerkMeanX"       "tBodyGyroJerkMeanY"      
    ## [47] "tBodyGyroJerkMeanZ"       "tBodyGyroJerkStdX"       
    ## [49] "tBodyGyroJerkStdY"        "tBodyGyroJerkStdZ"       
    ## [51] "tBodyGyroMagMean"         "tBodyGyroMagStd"         
    ## [53] "tBodyGyroMeanX"           "tBodyGyroMeanY"          
    ## [55] "tBodyGyroMeanZ"           "tBodyGyroStdX"           
    ## [57] "tBodyGyroStdY"            "tBodyGyroStdZ"           
    ## [59] "tGravityAccMagMean"       "tGravityAccMagStd"       
    ## [61] "tGravityAccMeanX"         "tGravityAccMeanY"        
    ## [63] "tGravityAccMeanZ"         "tGravityAccStdX"         
    ## [65] "tGravityAccStdY"          "tGravityAccStdZ"

**Mean**

The value of the mean of the feature for the activity performed by the
subject Double value based on the mean calculation
