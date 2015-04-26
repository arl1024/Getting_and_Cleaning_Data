# Getting_and_Cleaning_Data
Course project

1.- Join the files of identical patern name

2.- Add the name of variables

3.- Add the column activity (description)

4.- Read the columns without "mean or std" data

5.- Create a new data set with average of each variable for each activity and each subject

This data set extract only de measurements on dthe mean and STD for each measurement required in point 2nd. of project requirements

 [1] "activity"                           "subject"                           
 [3] "tBodyAccMeanX"                      "tBodyAccMeanY"                     
 [5] "tBodyAccMeanZ"                      "tBodyAccStdX"                      
 [7] "tBodyAccStdY"                       "tBodyAccStdZ"                      
 [9] "tGravityAccMeanX"                   "tGravityAccMeanY"                  
[11] "tGravityAccMeanZ"                   "tGravityAccStdX"                   
[13] "tGravityAccStdY"                    "tGravityAccStdZ"                   
[15] "tBodyAccJerkMeanX"                  "tBodyAccJerkMeanY"                 
[17] "tBodyAccJerkMeanZ"                  "tBodyAccJerkStdX"                  
[19] "tBodyAccJerkStdY"                   "tBodyAccJerkStdZ"                  
[21] "tBodyGyroMeanX"                     "tBodyGyroMeanY"                    
[23] "tBodyGyroMeanZ"                     "tBodyGyroStdX"                     
[25] "tBodyGyroStdY"                      "tBodyGyroStdZ"                     
[27] "tBodyGyroJerkMeanX"                 "tBodyGyroJerkMeanY"                
[29] "tBodyGyroJerkMeanZ"                 "tBodyGyroJerkStdX"                 
[31] "tBodyGyroJerkStdY"                  "tBodyGyroJerkStdZ"                 
[33] "tBodyAccMagMean"                    "tBodyAccMagStd"                    
[35] "tGravityAccMagMean"                 "tGravityAccMagStd"                 
[37] "tBodyAccJerkMagMean"                "tBodyAccJerkMagStd"                
[39] "tBodyGyroMagMean"                   "tBodyGyroMagStd"                   
[41] "tBodyGyroJerkMagMean"               "tBodyGyroJerkMagStd"               
[43] "fBodyAccMeanX"                      "fBodyAccMeanY"                     
[45] "fBodyAccMeanZ"                      "fBodyAccStdX"                      
[47] "fBodyAccStdY"                       "fBodyAccStdZ"                      
[49] "fBodyAccMeanFreqX"                  "fBodyAccMeanFreqY"                 
[51] "fBodyAccMeanFreqZ"                  "fBodyAccJerkMeanX"                 
[53] "fBodyAccJerkMeanY"                  "fBodyAccJerkMeanZ"                 
[55] "fBodyAccJerkStdX"                   "fBodyAccJerkStdY"                  
[57] "fBodyAccJerkStdZ"                   "fBodyAccJerkMeanFreqX"             
[59] "fBodyAccJerkMeanFreqY"              "fBodyAccJerkMeanFreqZ"             
[61] "fBodyGyroMeanX"                     "fBodyGyroMeanY"                    
[63] "fBodyGyroMeanZ"                     "fBodyGyroStdX"                     
[65] "fBodyGyroStdY"                      "fBodyGyroStdZ"                     
[67] "fBodyGyroMeanFreqX"                 "fBodyGyroMeanFreqY"                
[69] "fBodyGyroMeanFreqZ"                 "fBodyAccMagMean"                   
[71] "fBodyAccMagStd"                     "fBodyAccMagMeanFreq"               
[73] "fBodyBodyAccJerkMagMean"            "fBodyBodyAccJerkMagStd"            
[75] "fBodyBodyAccJerkMagMeanFreq"        "fBodyBodyGyroMagMean"              
[77] "fBodyBodyGyroMagStd"                "fBodyBodyGyroMagMeanFreq"          
[79] "fBodyBodyGyroJerkMagMean"           "fBodyBodyGyroJerkMagStd"           
[81] "fBodyBodyGyroJerkMagMeanFreq"       "angletBodyAccMean.gravity"         
[83] "angletBodyAccJerkMean.gravityMean"  "angletBodyGyroMean.gravityMean"    
[85] "angletBodyGyroJerkMean.gravityMean" "angleX.gravityMean"                
[87] "angleY.gravityMean"                 "angleZ.gravityMean"  

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

