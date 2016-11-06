---
author:
- 'M. Carmichael'
date: 'Sat Nov 5 23:23:09 2016'
title: Codebook
...

Objectives Overview

1)  Merges the training and the test sets to create one data set.

2)  Extracts only the measurements on the mean and standard deviation
    for each measurement.

3)  Uses descriptive activity names to name the activities in the data
    set

4)  Appropriately labels the data set with descriptive variable names.

5)  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject

6)  As an additional objective, the code book needs to update with new
    data or analysis. For this reason the code book is being generated
    in the run\_analysis.R work, which documents the code as well as
    updating the runbook.

Objective 1 - merge the training and testing data sets.

The data files are loaded from d396qusza40orc.cloudfront.net in a number
of files. There are a set of people (subjects), numbered one to thirty.
These subject have wearable monnitors which take measurements (some 561)
which are broken into 6 activities, walking, walking upstairs, walking
downstairs, sitting, standing, laying. There tests are broken into two
sets of data, the training work, and the testing work. The data files
are stored into two directories (test, train). The testx/trainx contain
the 561 variables (columns), and some 7K observations in test and 2k
observations. trainy/testy contain the activity code, the code
translation is found in the activity file. The trains/texts files
contain the subject identifier for the observations, hence we will add
them to the output as variables associated with observations. The
features file contains the names of the variables, which are not
approproatly descriptive and will need to be modified. To merge the data
sets we 1) Download the main data (test/train) 2) Add the subject data
(as columns) to the test/train data 3) Add the activity data (as
columns) to the test/ train data 4) combind the test/train data sets
into the combind data set

data set combind information

Objective 3/4 In order to optomize Objective 2, I will do Objective 3/4
renaming/labeling first. So take the number (which are now combined in
the column named activity) are convered from numbers to text. In
addition the column names are now expanded, to be more desciptive.
Special characters are removed, and the names are convered to lower
case.

*timebodyacceleratormeanx*, *timebodyacceleratormeany*,
*timebodyacceleratormeanz*, *timebodyacceleratorstandard-deviationx*,
*timebodyacceleratorstandard-deviationy*,
*timebodyacceleratorstandard-deviationz*,
*timebodyacceleratormedian-absolute-deviationx*,
*timebodyacceleratormedian-absolute-deviationy*,
*timebodyacceleratormedian-absolute-deviationz*,
*timebodyacceleratormaximumx*, *timebodyacceleratormaximumy*,
*timebodyacceleratormaximumz*, *timebodyacceleratorminimumx*,
*timebodyacceleratorminimumy*, *timebodyacceleratorminimumz*,
*timebodyacceleratorsignal-magnitutde-area*,
*timebodyacceleratorenergyx*, *timebodyacceleratorenergyy*,
*timebodyacceleratorenergyz*, *timebodyacceleratorinterquartile-rangex*,
*timebodyacceleratorinterquartile-rangey*,
*timebodyacceleratorinterquartile-rangez*,
*timebodyacceleratorentropyx*, *timebodyacceleratorentropyy*,
*timebodyacceleratorentropyz*,
*timebodyacceleratorautoregression-coefficentx1*,
*timebodyacceleratorautoregression-coefficentx2*,
*timebodyacceleratorautoregression-coefficentx3*,
*timebodyacceleratorautoregression-coefficentx4*,
*timebodyacceleratorautoregression-coefficenty1*,
*timebodyacceleratorautoregression-coefficenty2*,
*timebodyacceleratorautoregression-coefficenty3*,
*timebodyacceleratorautoregression-coefficenty4*,
*timebodyacceleratorautoregression-coefficentz1*,
*timebodyacceleratorautoregression-coefficentz2*,
*timebodyacceleratorautoregression-coefficentz3*,
*timebodyacceleratorautoregression-coefficentz4*,
*timebodyacceleratorcorrelationxy*, *timebodyacceleratorcorrelationxz*,
*timebodyacceleratorcorrelationyz*, *timegravityacceleratormeanx*,
*timegravityacceleratormeany*, *timegravityacceleratormeanz*,
*timegravityacceleratorstandard-deviationx*,
*timegravityacceleratorstandard-deviationy*,
*timegravityacceleratorstandard-deviationz*,
*timegravityacceleratormedian-absolute-deviationx*,
*timegravityacceleratormedian-absolute-deviationy*,
*timegravityacceleratormedian-absolute-deviationz*,
*timegravityacceleratormaximumx*, *timegravityacceleratormaximumy*,
*timegravityacceleratormaximumz*, *timegravityacceleratorminimumx*,
*timegravityacceleratorminimumy*, *timegravityacceleratorminimumz*,
*timegravityacceleratorsignal-magnitutde-area*,
*timegravityacceleratorenergyx*, *timegravityacceleratorenergyy*,
*timegravityacceleratorenergyz*,
*timegravityacceleratorinterquartile-rangex*,
*timegravityacceleratorinterquartile-rangey*,
*timegravityacceleratorinterquartile-rangez*,
*timegravityacceleratorentropyx*, *timegravityacceleratorentropyy*,
*timegravityacceleratorentropyz*,
*timegravityacceleratorautoregression-coefficentx1*,
*timegravityacceleratorautoregression-coefficentx2*,
*timegravityacceleratorautoregression-coefficentx3*,
*timegravityacceleratorautoregression-coefficentx4*,
*timegravityacceleratorautoregression-coefficenty1*,
*timegravityacceleratorautoregression-coefficenty2*,
*timegravityacceleratorautoregression-coefficenty3*,
*timegravityacceleratorautoregression-coefficenty4*,
*timegravityacceleratorautoregression-coefficentz1*,
*timegravityacceleratorautoregression-coefficentz2*,
*timegravityacceleratorautoregression-coefficentz3*,
*timegravityacceleratorautoregression-coefficentz4*,
*timegravityacceleratorcorrelationxy*,
*timegravityacceleratorcorrelationxz*,
*timegravityacceleratorcorrelationyz*, *timebodyacceleratorjerkmeanx*,
*timebodyacceleratorjerkmeany*, *timebodyacceleratorjerkmeanz*,
*timebodyacceleratorjerkstandard-deviationx*,
*timebodyacceleratorjerkstandard-deviationy*,
*timebodyacceleratorjerkstandard-deviationz*,
*timebodyacceleratorjerkmedian-absolute-deviationx*,
*timebodyacceleratorjerkmedian-absolute-deviationy*,
*timebodyacceleratorjerkmedian-absolute-deviationz*,
*timebodyacceleratorjerkmaximumx*, *timebodyacceleratorjerkmaximumy*,
*timebodyacceleratorjerkmaximumz*, *timebodyacceleratorjerkminimumx*,
*timebodyacceleratorjerkminimumy*, *timebodyacceleratorjerkminimumz*,
*timebodyacceleratorjerksignal-magnitutde-area*,
*timebodyacceleratorjerkenergyx*, *timebodyacceleratorjerkenergyy*,
*timebodyacceleratorjerkenergyz*,
*timebodyacceleratorjerkinterquartile-rangex*,
*timebodyacceleratorjerkinterquartile-rangey*,
*timebodyacceleratorjerkinterquartile-rangez*,
*timebodyacceleratorjerkentropyx*, *timebodyacceleratorjerkentropyy*,
*timebodyacceleratorjerkentropyz*,
*timebodyacceleratorjerkautoregression-coefficentx1*,
*timebodyacceleratorjerkautoregression-coefficentx2*,
*timebodyacceleratorjerkautoregression-coefficentx3*,
*timebodyacceleratorjerkautoregression-coefficentx4*,
*timebodyacceleratorjerkautoregression-coefficenty1*,
*timebodyacceleratorjerkautoregression-coefficenty2*,
*timebodyacceleratorjerkautoregression-coefficenty3*,
*timebodyacceleratorjerkautoregression-coefficenty4*,
*timebodyacceleratorjerkautoregression-coefficentz1*,
*timebodyacceleratorjerkautoregression-coefficentz2*,
*timebodyacceleratorjerkautoregression-coefficentz3*,
*timebodyacceleratorjerkautoregression-coefficentz4*,
*timebodyacceleratorjerkcorrelationxy*,
*timebodyacceleratorjerkcorrelationxz*,
*timebodyacceleratorjerkcorrelationyz*, *timebodygryoscopemeanx*,
*timebodygryoscopemeany*, *timebodygryoscopemeanz*,
*timebodygryoscopestandard-deviationx*,
*timebodygryoscopestandard-deviationy*,
*timebodygryoscopestandard-deviationz*,
*timebodygryoscopemedian-absolute-deviationx*,
*timebodygryoscopemedian-absolute-deviationy*,
*timebodygryoscopemedian-absolute-deviationz*,
*timebodygryoscopemaximumx*, *timebodygryoscopemaximumy*,
*timebodygryoscopemaximumz*, *timebodygryoscopeminimumx*,
*timebodygryoscopeminimumy*, *timebodygryoscopeminimumz*,
*timebodygryoscopesignal-magnitutde-area*, *timebodygryoscopeenergyx*,
*timebodygryoscopeenergyy*, *timebodygryoscopeenergyz*,
*timebodygryoscopeinterquartile-rangex*,
*timebodygryoscopeinterquartile-rangey*,
*timebodygryoscopeinterquartile-rangez*, *timebodygryoscopeentropyx*,
*timebodygryoscopeentropyy*, *timebodygryoscopeentropyz*,
*timebodygryoscopeautoregression-coefficentx1*,
*timebodygryoscopeautoregression-coefficentx2*,
*timebodygryoscopeautoregression-coefficentx3*,
*timebodygryoscopeautoregression-coefficentx4*,
*timebodygryoscopeautoregression-coefficenty1*,
*timebodygryoscopeautoregression-coefficenty2*,
*timebodygryoscopeautoregression-coefficenty3*,
*timebodygryoscopeautoregression-coefficenty4*,
*timebodygryoscopeautoregression-coefficentz1*,
*timebodygryoscopeautoregression-coefficentz2*,
*timebodygryoscopeautoregression-coefficentz3*,
*timebodygryoscopeautoregression-coefficentz4*,
*timebodygryoscopecorrelationxy*, *timebodygryoscopecorrelationxz*,
*timebodygryoscopecorrelationyz*, *timebodygryoscopejerkmeanx*,
*timebodygryoscopejerkmeany*, *timebodygryoscopejerkmeanz*,
*timebodygryoscopejerkstandard-deviationx*,
*timebodygryoscopejerkstandard-deviationy*,
*timebodygryoscopejerkstandard-deviationz*,
*timebodygryoscopejerkmedian-absolute-deviationx*,
*timebodygryoscopejerkmedian-absolute-deviationy*,
*timebodygryoscopejerkmedian-absolute-deviationz*,
*timebodygryoscopejerkmaximumx*, *timebodygryoscopejerkmaximumy*,
*timebodygryoscopejerkmaximumz*, *timebodygryoscopejerkminimumx*,
*timebodygryoscopejerkminimumy*, *timebodygryoscopejerkminimumz*,
*timebodygryoscopejerksignal-magnitutde-area*,
*timebodygryoscopejerkenergyx*, *timebodygryoscopejerkenergyy*,
*timebodygryoscopejerkenergyz*,
*timebodygryoscopejerkinterquartile-rangex*,
*timebodygryoscopejerkinterquartile-rangey*,
*timebodygryoscopejerkinterquartile-rangez*,
*timebodygryoscopejerkentropyx*, *timebodygryoscopejerkentropyy*,
*timebodygryoscopejerkentropyz*,
*timebodygryoscopejerkautoregression-coefficentx1*,
*timebodygryoscopejerkautoregression-coefficentx2*,
*timebodygryoscopejerkautoregression-coefficentx3*,
*timebodygryoscopejerkautoregression-coefficentx4*,
*timebodygryoscopejerkautoregression-coefficenty1*,
*timebodygryoscopejerkautoregression-coefficenty2*,
*timebodygryoscopejerkautoregression-coefficenty3*,
*timebodygryoscopejerkautoregression-coefficenty4*,
*timebodygryoscopejerkautoregression-coefficentz1*,
*timebodygryoscopejerkautoregression-coefficentz2*,
*timebodygryoscopejerkautoregression-coefficentz3*,
*timebodygryoscopejerkautoregression-coefficentz4*,
*timebodygryoscopejerkcorrelationxy*,
*timebodygryoscopejerkcorrelationxz*,
*timebodygryoscopejerkcorrelationyz*,
*timebodyacceleratormagnitudemean*,
*timebodyacceleratormagnitudestandard-deviation*,
*timebodyacceleratormagnitudemedian-absolute-deviation*,
*timebodyacceleratormagnitudemaximum*,
*timebodyacceleratormagnitudeminimum*,
*timebodyacceleratormagnitudesignal-magnitutde-area*,
*timebodyacceleratormagnitudeenergy*,
*timebodyacceleratormagnitudeinterquartile-range*,
*timebodyacceleratormagnitudeentropy*,
*timebodyacceleratormagnitudeautoregression-coefficent1*,
*timebodyacceleratormagnitudeautoregression-coefficent2*,
*timebodyacceleratormagnitudeautoregression-coefficent3*,
*timebodyacceleratormagnitudeautoregression-coefficent4*,
*timegravityacceleratormagnitudemean*,
*timegravityacceleratormagnitudestandard-deviation*,
*timegravityacceleratormagnitudemedian-absolute-deviation*,
*timegravityacceleratormagnitudemaximum*,
*timegravityacceleratormagnitudeminimum*,
*timegravityacceleratormagnitudesignal-magnitutde-area*,
*timegravityacceleratormagnitudeenergy*,
*timegravityacceleratormagnitudeinterquartile-range*,
*timegravityacceleratormagnitudeentropy*,
*timegravityacceleratormagnitudeautoregression-coefficent1*,
*timegravityacceleratormagnitudeautoregression-coefficent2*,
*timegravityacceleratormagnitudeautoregression-coefficent3*,
*timegravityacceleratormagnitudeautoregression-coefficent4*,
*timebodyacceleratorjerkmagnitudemean*,
*timebodyacceleratorjerkmagnitudestandard-deviation*,
*timebodyacceleratorjerkmagnitudemedian-absolute-deviation*,
*timebodyacceleratorjerkmagnitudemaximum*,
*timebodyacceleratorjerkmagnitudeminimum*,
*timebodyacceleratorjerkmagnitudesignal-magnitutde-area*,
*timebodyacceleratorjerkmagnitudeenergy*,
*timebodyacceleratorjerkmagnitudeinterquartile-range*,
*timebodyacceleratorjerkmagnitudeentropy*,
*timebodyacceleratorjerkmagnitudeautoregression-coefficent1*,
*timebodyacceleratorjerkmagnitudeautoregression-coefficent2*,
*timebodyacceleratorjerkmagnitudeautoregression-coefficent3*,
*timebodyacceleratorjerkmagnitudeautoregression-coefficent4*,
*timebodygryoscopemagnitudemean*,
*timebodygryoscopemagnitudestandard-deviation*,
*timebodygryoscopemagnitudemedian-absolute-deviation*,
*timebodygryoscopemagnitudemaximum*,
*timebodygryoscopemagnitudeminimum*,
*timebodygryoscopemagnitudesignal-magnitutde-area*,
*timebodygryoscopemagnitudeenergy*,
*timebodygryoscopemagnitudeinterquartile-range*,
*timebodygryoscopemagnitudeentropy*,
*timebodygryoscopemagnitudeautoregression-coefficent1*,
*timebodygryoscopemagnitudeautoregression-coefficent2*,
*timebodygryoscopemagnitudeautoregression-coefficent3*,
*timebodygryoscopemagnitudeautoregression-coefficent4*,
*timebodygryoscopejerkmagnitudemean*,
*timebodygryoscopejerkmagnitudestandard-deviation*,
*timebodygryoscopejerkmagnitudemedian-absolute-deviation*,
*timebodygryoscopejerkmagnitudemaximum*,
*timebodygryoscopejerkmagnitudeminimum*,
*timebodygryoscopejerkmagnitudesignal-magnitutde-area*,
*timebodygryoscopejerkmagnitudeenergy*,
*timebodygryoscopejerkmagnitudeinterquartile-range*,
*timebodygryoscopejerkmagnitudeentropy*,
*timebodygryoscopejerkmagnitudeautoregression-coefficent1*,
*timebodygryoscopejerkmagnitudeautoregression-coefficent2*,
*timebodygryoscopejerkmagnitudeautoregression-coefficent3*,
*timebodygryoscopejerkmagnitudeautoregression-coefficent4*,
*frequencybodyacceleratormeanx*, *frequencybodyacceleratormeany*,
*frequencybodyacceleratormeanz*,
*frequencybodyacceleratorstandard-deviationx*,
*frequencybodyacceleratorstandard-deviationy*,
*frequencybodyacceleratorstandard-deviationz*,
*frequencybodyacceleratormedian-absolute-deviationx*,
*frequencybodyacceleratormedian-absolute-deviationy*,
*frequencybodyacceleratormedian-absolute-deviationz*,
*frequencybodyacceleratormaximumx*, *frequencybodyacceleratormaximumy*,
*frequencybodyacceleratormaximumz*, *frequencybodyacceleratorminimumx*,
*frequencybodyacceleratorminimumy*, *frequencybodyacceleratorminimumz*,
*frequencybodyacceleratorsignal-magnitutde-area*,
*frequencybodyacceleratorenergyx*, *frequencybodyacceleratorenergyy*,
*frequencybodyacceleratorenergyz*,
*frequencybodyacceleratorinterquartile-rangex*,
*frequencybodyacceleratorinterquartile-rangey*,
*frequencybodyacceleratorinterquartile-rangez*,
*frequencybodyacceleratorentropyx*, *frequencybodyacceleratorentropyy*,
*frequencybodyacceleratorentropyz*,
*frequencybodyacceleratormaximumindsx*,
*frequencybodyacceleratormaximumindsy*,
*frequencybodyacceleratormaximumindsz*,
*frequencybodyacceleratormeanfreqx*,
*frequencybodyacceleratormeanfreqy*,
*frequencybodyacceleratormeanfreqz*,
*frequencybodyacceleratorskewnessx*,
*frequencybodyacceleratorkurtosisx*,
*frequencybodyacceleratorskewnessy*,
*frequencybodyacceleratorkurtosisy*,
*frequencybodyacceleratorskewnessz*,
*frequencybodyacceleratorkurtosisz*,
*frequencybodyacceleratorbandsenergy18*,
*frequencybodyacceleratorbandsenergy916*,
*frequencybodyacceleratorbandsenergy1724*,
*frequencybodyacceleratorbandsenergy2532*,
*frequencybodyacceleratorbandsenergy3340*,
*frequencybodyacceleratorbandsenergy4148*,
*frequencybodyacceleratorbandsenergy4956*,
*frequencybodyacceleratorbandsenergy5764*,
*frequencybodyacceleratorbandsenergy116*,
*frequencybodyacceleratorbandsenergy1732*,
*frequencybodyacceleratorbandsenergy3348*,
*frequencybodyacceleratorbandsenergy4964*,
*frequencybodyacceleratorbandsenergy124*,
*frequencybodyacceleratorbandsenergy2548*,
*frequencybodyacceleratorbandsenergy18*,
*frequencybodyacceleratorbandsenergy916*,
*frequencybodyacceleratorbandsenergy1724*,
*frequencybodyacceleratorbandsenergy2532*,
*frequencybodyacceleratorbandsenergy3340*,
*frequencybodyacceleratorbandsenergy4148*,
*frequencybodyacceleratorbandsenergy4956*,
*frequencybodyacceleratorbandsenergy5764*,
*frequencybodyacceleratorbandsenergy116*,
*frequencybodyacceleratorbandsenergy1732*,
*frequencybodyacceleratorbandsenergy3348*,
*frequencybodyacceleratorbandsenergy4964*,
*frequencybodyacceleratorbandsenergy124*,
*frequencybodyacceleratorbandsenergy2548*,
*frequencybodyacceleratorbandsenergy18*,
*frequencybodyacceleratorbandsenergy916*,
*frequencybodyacceleratorbandsenergy1724*,
*frequencybodyacceleratorbandsenergy2532*,
*frequencybodyacceleratorbandsenergy3340*,
*frequencybodyacceleratorbandsenergy4148*,
*frequencybodyacceleratorbandsenergy4956*,
*frequencybodyacceleratorbandsenergy5764*,
*frequencybodyacceleratorbandsenergy116*,
*frequencybodyacceleratorbandsenergy1732*,
*frequencybodyacceleratorbandsenergy3348*,
*frequencybodyacceleratorbandsenergy4964*,
*frequencybodyacceleratorbandsenergy124*,
*frequencybodyacceleratorbandsenergy2548*,
*frequencybodyacceleratorjerkmeanx*,
*frequencybodyacceleratorjerkmeany*,
*frequencybodyacceleratorjerkmeanz*,
*frequencybodyacceleratorjerkstandard-deviationx*,
*frequencybodyacceleratorjerkstandard-deviationy*,
*frequencybodyacceleratorjerkstandard-deviationz*,
*frequencybodyacceleratorjerkmedian-absolute-deviationx*,
*frequencybodyacceleratorjerkmedian-absolute-deviationy*,
*frequencybodyacceleratorjerkmedian-absolute-deviationz*,
*frequencybodyacceleratorjerkmaximumx*,
*frequencybodyacceleratorjerkmaximumy*,
*frequencybodyacceleratorjerkmaximumz*,
*frequencybodyacceleratorjerkminimumx*,
*frequencybodyacceleratorjerkminimumy*,
*frequencybodyacceleratorjerkminimumz*,
*frequencybodyacceleratorjerksignal-magnitutde-area*,
*frequencybodyacceleratorjerkenergyx*,
*frequencybodyacceleratorjerkenergyy*,
*frequencybodyacceleratorjerkenergyz*,
*frequencybodyacceleratorjerkinterquartile-rangex*,
*frequencybodyacceleratorjerkinterquartile-rangey*,
*frequencybodyacceleratorjerkinterquartile-rangez*,
*frequencybodyacceleratorjerkentropyx*,
*frequencybodyacceleratorjerkentropyy*,
*frequencybodyacceleratorjerkentropyz*,
*frequencybodyacceleratorjerkmaximumindsx*,
*frequencybodyacceleratorjerkmaximumindsy*,
*frequencybodyacceleratorjerkmaximumindsz*,
*frequencybodyacceleratorjerkmeanfreqx*,
*frequencybodyacceleratorjerkmeanfreqy*,
*frequencybodyacceleratorjerkmeanfreqz*,
*frequencybodyacceleratorjerkskewnessx*,
*frequencybodyacceleratorjerkkurtosisx*,
*frequencybodyacceleratorjerkskewnessy*,
*frequencybodyacceleratorjerkkurtosisy*,
*frequencybodyacceleratorjerkskewnessz*,
*frequencybodyacceleratorjerkkurtosisz*,
*frequencybodyacceleratorjerkbandsenergy18*,
*frequencybodyacceleratorjerkbandsenergy916*,
*frequencybodyacceleratorjerkbandsenergy1724*,
*frequencybodyacceleratorjerkbandsenergy2532*,
*frequencybodyacceleratorjerkbandsenergy3340*,
*frequencybodyacceleratorjerkbandsenergy4148*,
*frequencybodyacceleratorjerkbandsenergy4956*,
*frequencybodyacceleratorjerkbandsenergy5764*,
*frequencybodyacceleratorjerkbandsenergy116*,
*frequencybodyacceleratorjerkbandsenergy1732*,
*frequencybodyacceleratorjerkbandsenergy3348*,
*frequencybodyacceleratorjerkbandsenergy4964*,
*frequencybodyacceleratorjerkbandsenergy124*,
*frequencybodyacceleratorjerkbandsenergy2548*,
*frequencybodyacceleratorjerkbandsenergy18*,
*frequencybodyacceleratorjerkbandsenergy916*,
*frequencybodyacceleratorjerkbandsenergy1724*,
*frequencybodyacceleratorjerkbandsenergy2532*,
*frequencybodyacceleratorjerkbandsenergy3340*,
*frequencybodyacceleratorjerkbandsenergy4148*,
*frequencybodyacceleratorjerkbandsenergy4956*,
*frequencybodyacceleratorjerkbandsenergy5764*,
*frequencybodyacceleratorjerkbandsenergy116*,
*frequencybodyacceleratorjerkbandsenergy1732*,
*frequencybodyacceleratorjerkbandsenergy3348*,
*frequencybodyacceleratorjerkbandsenergy4964*,
*frequencybodyacceleratorjerkbandsenergy124*,
*frequencybodyacceleratorjerkbandsenergy2548*,
*frequencybodyacceleratorjerkbandsenergy18*,
*frequencybodyacceleratorjerkbandsenergy916*,
*frequencybodyacceleratorjerkbandsenergy1724*,
*frequencybodyacceleratorjerkbandsenergy2532*,
*frequencybodyacceleratorjerkbandsenergy3340*,
*frequencybodyacceleratorjerkbandsenergy4148*,
*frequencybodyacceleratorjerkbandsenergy4956*,
*frequencybodyacceleratorjerkbandsenergy5764*,
*frequencybodyacceleratorjerkbandsenergy116*,
*frequencybodyacceleratorjerkbandsenergy1732*,
*frequencybodyacceleratorjerkbandsenergy3348*,
*frequencybodyacceleratorjerkbandsenergy4964*,
*frequencybodyacceleratorjerkbandsenergy124*,
*frequencybodyacceleratorjerkbandsenergy2548*,
*frequencybodygryoscopemeanx*, *frequencybodygryoscopemeany*,
*frequencybodygryoscopemeanz*,
*frequencybodygryoscopestandard-deviationx*,
*frequencybodygryoscopestandard-deviationy*,
*frequencybodygryoscopestandard-deviationz*,
*frequencybodygryoscopemedian-absolute-deviationx*,
*frequencybodygryoscopemedian-absolute-deviationy*,
*frequencybodygryoscopemedian-absolute-deviationz*,
*frequencybodygryoscopemaximumx*, *frequencybodygryoscopemaximumy*,
*frequencybodygryoscopemaximumz*, *frequencybodygryoscopeminimumx*,
*frequencybodygryoscopeminimumy*, *frequencybodygryoscopeminimumz*,
*frequencybodygryoscopesignal-magnitutde-area*,
*frequencybodygryoscopeenergyx*, *frequencybodygryoscopeenergyy*,
*frequencybodygryoscopeenergyz*,
*frequencybodygryoscopeinterquartile-rangex*,
*frequencybodygryoscopeinterquartile-rangey*,
*frequencybodygryoscopeinterquartile-rangez*,
*frequencybodygryoscopeentropyx*, *frequencybodygryoscopeentropyy*,
*frequencybodygryoscopeentropyz*, *frequencybodygryoscopemaximumindsx*,
*frequencybodygryoscopemaximumindsy*,
*frequencybodygryoscopemaximumindsz*, *frequencybodygryoscopemeanfreqx*,
*frequencybodygryoscopemeanfreqy*, *frequencybodygryoscopemeanfreqz*,
*frequencybodygryoscopeskewnessx*, *frequencybodygryoscopekurtosisx*,
*frequencybodygryoscopeskewnessy*, *frequencybodygryoscopekurtosisy*,
*frequencybodygryoscopeskewnessz*, *frequencybodygryoscopekurtosisz*,
*frequencybodygryoscopebandsenergy18*,
*frequencybodygryoscopebandsenergy916*,
*frequencybodygryoscopebandsenergy1724*,
*frequencybodygryoscopebandsenergy2532*,
*frequencybodygryoscopebandsenergy3340*,
*frequencybodygryoscopebandsenergy4148*,
*frequencybodygryoscopebandsenergy4956*,
*frequencybodygryoscopebandsenergy5764*,
*frequencybodygryoscopebandsenergy116*,
*frequencybodygryoscopebandsenergy1732*,
*frequencybodygryoscopebandsenergy3348*,
*frequencybodygryoscopebandsenergy4964*,
*frequencybodygryoscopebandsenergy124*,
*frequencybodygryoscopebandsenergy2548*,
*frequencybodygryoscopebandsenergy18*,
*frequencybodygryoscopebandsenergy916*,
*frequencybodygryoscopebandsenergy1724*,
*frequencybodygryoscopebandsenergy2532*,
*frequencybodygryoscopebandsenergy3340*,
*frequencybodygryoscopebandsenergy4148*,
*frequencybodygryoscopebandsenergy4956*,
*frequencybodygryoscopebandsenergy5764*,
*frequencybodygryoscopebandsenergy116*,
*frequencybodygryoscopebandsenergy1732*,
*frequencybodygryoscopebandsenergy3348*,
*frequencybodygryoscopebandsenergy4964*,
*frequencybodygryoscopebandsenergy124*,
*frequencybodygryoscopebandsenergy2548*,
*frequencybodygryoscopebandsenergy18*,
*frequencybodygryoscopebandsenergy916*,
*frequencybodygryoscopebandsenergy1724*,
*frequencybodygryoscopebandsenergy2532*,
*frequencybodygryoscopebandsenergy3340*,
*frequencybodygryoscopebandsenergy4148*,
*frequencybodygryoscopebandsenergy4956*,
*frequencybodygryoscopebandsenergy5764*,
*frequencybodygryoscopebandsenergy116*,
*frequencybodygryoscopebandsenergy1732*,
*frequencybodygryoscopebandsenergy3348*,
*frequencybodygryoscopebandsenergy4964*,
*frequencybodygryoscopebandsenergy124*,
*frequencybodygryoscopebandsenergy2548*,
*frequencybodyacceleratormagnitudemean*,
*frequencybodyacceleratormagnitudestandard-deviation*,
*frequencybodyacceleratormagnitudemedian-absolute-deviation*,
*frequencybodyacceleratormagnitudemaximum*,
*frequencybodyacceleratormagnitudeminimum*,
*frequencybodyacceleratormagnitudesignal-magnitutde-area*,
*frequencybodyacceleratormagnitudeenergy*,
*frequencybodyacceleratormagnitudeinterquartile-range*,
*frequencybodyacceleratormagnitudeentropy*,
*frequencybodyacceleratormagnitudemaximuminds*,
*frequencybodyacceleratormagnitudemeanfreq*,
*frequencybodyacceleratormagnitudeskewness*,
*frequencybodyacceleratormagnitudekurtosis*,
*frequencybodybodyacceleratorjerkmagnitudemean*,
*frequencybodybodyacceleratorjerkmagnitudestandard-deviation*,
*frequencybodybodyacceleratorjerkmagnitudemedian-absolute-deviation*,
*frequencybodybodyacceleratorjerkmagnitudemaximum*,
*frequencybodybodyacceleratorjerkmagnitudeminimum*,
*frequencybodybodyacceleratorjerkmagnitudesignal-magnitutde-area*,
*frequencybodybodyacceleratorjerkmagnitudeenergy*,
*frequencybodybodyacceleratorjerkmagnitudeinterquartile-range*,
*frequencybodybodyacceleratorjerkmagnitudeentropy*,
*frequencybodybodyacceleratorjerkmagnitudemaximuminds*,
*frequencybodybodyacceleratorjerkmagnitudemeanfreq*,
*frequencybodybodyacceleratorjerkmagnitudeskewness*,
*frequencybodybodyacceleratorjerkmagnitudekurtosis*,
*frequencybodybodygryoscopemagnitudemean*,
*frequencybodybodygryoscopemagnitudestandard-deviation*,
*frequencybodybodygryoscopemagnitudemedian-absolute-deviation*,
*frequencybodybodygryoscopemagnitudemaximum*,
*frequencybodybodygryoscopemagnitudeminimum*,
*frequencybodybodygryoscopemagnitudesignal-magnitutde-area*,
*frequencybodybodygryoscopemagnitudeenergy*,
*frequencybodybodygryoscopemagnitudeinterquartile-range*,
*frequencybodybodygryoscopemagnitudeentropy*,
*frequencybodybodygryoscopemagnitudemaximuminds*,
*frequencybodybodygryoscopemagnitudemeanfreq*,
*frequencybodybodygryoscopemagnitudeskewness*,
*frequencybodybodygryoscopemagnitudekurtosis*,
*frequencybodybodygryoscopejerkmagnitudemean*,
*frequencybodybodygryoscopejerkmagnitudestandard-deviation*,
*frequencybodybodygryoscopejerkmagnitudemedian-absolute-deviation*,
*frequencybodybodygryoscopejerkmagnitudemaximum*,
*frequencybodybodygryoscopejerkmagnitudeminimum*,
*frequencybodybodygryoscopejerkmagnitudesignal-magnitutde-area*,
*frequencybodybodygryoscopejerkmagnitudeenergy*,
*frequencybodybodygryoscopejerkmagnitudeinterquartile-range*,
*frequencybodybodygryoscopejerkmagnitudeentropy*,
*frequencybodybodygryoscopejerkmagnitudemaximuminds*,
*frequencybodybodygryoscopejerkmagnitudemeanfreq*,
*frequencybodybodygryoscopejerkmagnitudeskewness*,
*frequencybodybodygryoscopejerkmagnitudekurtosis*,
*angletbodyacceleratormeangravity*,
*angletbodyacceleratorjerkmeangravitymean*,
*angletbodygryoscopemeangravitymean*,
*angletbodygryoscopejerkmeangravitymean*, *anglexgravitymean*,
*angleygravitymean*, *anglezgravitymean*, *subject* and *activity*

Objective 2 Since the column names are adjusted on the dataset 'combind'
then we grep the right column names for our future required data set
selected column numbers

*1*, *2*, *3*, *4*, *5*, *6*, *41*, *42*, *43*, *44*, *45*, *46*, *81*,
*82*, *83*, *84*, *85*, *86*, *121*, *122*, *123*, *124*, *125*, *126*,
*161*, *162*, *163*, *164*, *165*, *166*, *201*, *202*, *214*, *215*,
*227*, *228*, *240*, *241*, *253*, *254*, *266*, *267*, *268*, *269*,
*270*, *271*, *294*, *295*, *296*, *345*, *346*, *347*, *348*, *349*,
*350*, *373*, *374*, *375*, *424*, *425*, *426*, *427*, *428*, *429*,
*452*, *453*, *454*, *503*, *504*, *513*, *516*, *517*, *526*, *529*,
*530*, *539*, *542*, *543*, *552*, *555*, *556*, *557*, *558*, *559*,
*560* and *561*

Objective 5 The tidydata is created by selecting the appropraite data
from the combined data, then renaming the final dataset, called
tidydata, then applying the mean function (for the average) of the
variables. After which we write the file

       activity        subject    timebodyacceleratormeanx
  ------------------- ---------- --------------------------
        LAYING         Subject1            0.2216
        SITTING        Subject1            0.2612
       STANDING        Subject1            0.2789
        WALKING        Subject1            0.2773
  WALKING\_DOWNSTAIRS  Subject1            0.2892
   WALKING\_UPSTAIRS   Subject1            0.2555

  : Table continues below

   timebodyacceleratormeany    timebodyacceleratormeanz
  --------------------------- ---------------------------
           -0.04051                     -0.1132
           -0.001308                    -0.1045
           -0.01614                     -0.1106
           -0.01738                     -0.1111
           -0.009919                    -0.1076
           -0.02395                     -0.0973

  : Table continues below

   timebodyacceleratorstandard-deviationx
  ----------------------------------------
                  -0.9281
                  -0.9772
                  -0.9958
                  -0.2837
                  0.03004
                  -0.3547

  : Table continues below

   timebodyacceleratorstandard-deviationy
  ----------------------------------------
                  -0.8368
                  -0.9226
                  -0.9732
                   0.1145
                  -0.03194
                  -0.00232

  : Table continues below

   timebodyacceleratorstandard-deviationz    timegravityacceleratormeanx
  ----------------------------------------- -----------------------------
                   -0.8261                             -0.2489
                   -0.9396                             0.8315
                   -0.9798                              0.943
                    -0.26                              0.9352
                   -0.2304                             0.9319
                  -0.01948                             0.8934

  : Table continues below

   timegravityacceleratormeany    timegravityacceleratormeanz
  ------------------------------ ------------------------------
              0.7055                         0.4458
              0.2044                         0.332
              -0.273                        0.01349
             -0.2822                        -0.0681
             -0.2666                        -0.06212
             -0.3622                        -0.0754

  : Table continues below

   timegravityacceleratorstandard-deviationx
  -------------------------------------------
                    -0.8968
                    -0.9685
                    -0.9938
                    -0.9766
                    -0.9506
                    -0.9564

  : Table continues below

   timegravityacceleratorstandard-deviationy
  -------------------------------------------
                    -0.9077
                    -0.9355
                    -0.9812
                    -0.9713
                    -0.937
                    -0.9528

  : Table continues below

  timegravityacceleratorstandard-deviationz  timebodyacceleratorjerkmeanx
  ------------------------------------------ -----------------------------
                   -0.8524                              0.08109
                    -0.949                              0.07748
                   -0.9763                              0.07538
                   -0.9477                              0.07404
                   -0.8959                              0.05416
                   -0.9124                              0.1014

  : Table continues below

   timebodyacceleratorjerkmeany    timebodyacceleratorjerkmeanz
  ------------------------------- -------------------------------
             0.003838                         0.01083
            -0.0006191                       -0.003368
             0.007976                        -0.003685
              0.02827                        -0.004168
              0.02965                        -0.01097
              0.01949                        -0.04556

  : Table continues below

   timebodyacceleratorjerkstandard-deviationx
  --------------------------------------------
                    -0.9585
                    -0.9864
                    -0.9946
                    -0.1136
                    -0.01228
                    -0.4468

  : Table continues below

   timebodyacceleratorjerkstandard-deviationy
  --------------------------------------------
                    -0.9241
                    -0.9814
                    -0.9856
                     0.067
                    -0.1016
                    -0.3783

  : Table continues below

   timebodyacceleratorjerkstandard-deviationz    timebodygryoscopemeanx
  --------------------------------------------- ------------------------
                     -0.9549                            -0.01655
                     -0.9879                            -0.04535
                     -0.9923                            -0.02399
                     -0.5027                            -0.04183
                     -0.3457                            -0.03508
                     -0.7066                            0.05055

  : Table continues below

   timebodygryoscopemeany    timebodygryoscopemeanz
  ------------------------- -------------------------
          -0.06449                   0.1487
          -0.09192                   0.06293
           -0.0594                   0.0748
          -0.06953                   0.08494
          -0.09094                   0.09009
           -0.1662                   0.05836

  : Table continues below

  timebodygryoscopestandard-deviationx timebodygryoscopestandard-deviationy
  ------------------------------------ ------------------------------------
                -0.8735                              -0.9511
                -0.9772                              -0.9665
                -0.9872                              -0.9877
                -0.4735                              -0.05461
                 -0.458                              -0.1263
                -0.5449                              0.004105

  : Table continues below

   timebodygryoscopestandard-deviationz    timebodygryoscopejerkmeanx
  --------------------------------------- ----------------------------
                  -0.9083                           -0.1073
                  -0.9414                           -0.09368
                  -0.9806                           -0.09961
                  -0.3443                            -0.09
                  -0.1247                           -0.07396
                  -0.5072                           -0.1222

  : Table continues below

   timebodygryoscopejerkmeany    timebodygryoscopejerkmeanz
  ----------------------------- -----------------------------
            -0.04152                      -0.07405
            -0.04021                       -0.0467
            -0.04406                      -0.04895
            -0.03984                      -0.04613
            -0.04399                      -0.02705
            -0.04215                      -0.04071

  : Table continues below

   timebodygryoscopejerkstandard-deviationx
  ------------------------------------------
                   -0.9186
                   -0.9917
                   -0.9929
                   -0.2074
                    -0.487
                   -0.6148

  : Table continues below

   timebodygryoscopejerkstandard-deviationy
  ------------------------------------------
                   -0.9679
                   -0.9895
                   -0.9951
                   -0.3045
                   -0.2388
                   -0.6017

  : Table continues below

  ------------------------------------------------------------------------
  timebodygryoscopejerkstandard-deviationz timebodyacceleratormagnitudemea
                                                          n
  ---------------------------------------- -------------------------------
                  -0.9578                              -0.8419

                  -0.9879                              -0.9485

                  -0.9921                              -0.9843

                  -0.4043                              -0.137

                  -0.2688                              0.02719

                  -0.6063                              -0.1299
  ------------------------------------------------------------------------

  : Table continues below

   timebodyacceleratormagnitudestandard-deviation
  ------------------------------------------------
                      -0.7951
                      -0.9271
                      -0.9819
                      -0.2197
                      0.01988
                       -0.325

  : Table continues below

   timegravityacceleratormagnitudemean
  -------------------------------------
                 -0.8419
                 -0.9485
                 -0.9843
                 -0.137
                 0.02719
                 -0.1299

  : Table continues below

   timegravityacceleratormagnitudestandard-deviation
  ---------------------------------------------------
                        -0.7951
                        -0.9271
                        -0.9819
                        -0.2197
                        0.01988
                        -0.325

  : Table continues below

   timebodyacceleratorjerkmagnitudemean
  --------------------------------------
                 -0.9544
                 -0.9874
                 -0.9924
                 -0.1414
                 -0.08945
                 -0.4665

  : Table continues below

   timebodyacceleratorjerkmagnitudestandard-deviation
  ----------------------------------------------------
                        -0.9282
                        -0.9841
                        -0.9931
                        -0.07447
                        -0.02579
                         -0.479

  : Table continues below

  ------------------------------------------------------------------------
  timebodygryoscopemagnitudemean timebodygryoscopemagnitudestandard-deviat
                                                    ion
  ------------------------------ -----------------------------------------
             -0.8748                              -0.819

             -0.9309                              -0.9345

             -0.9765                              -0.9787

              -0.161                              -0.187

             -0.07574                             -0.2257

             -0.1267                              -0.1486
  ------------------------------------------------------------------------

  : Table continues below

   timebodygryoscopejerkmagnitudemean
  ------------------------------------
                -0.9635
                 -0.992
                 -0.995
                -0.2987
                -0.2955
                -0.5949

  : Table continues below

   timebodygryoscopejerkmagnitudestandard-deviation
  --------------------------------------------------
                       -0.9358
                       -0.9883
                       -0.9947
                       -0.3253
                       -0.3065
                       -0.6486

  : Table continues below

   frequencybodyacceleratormeanx    frequencybodyacceleratormeany
  -------------------------------- --------------------------------
              -0.9391                          -0.8671
              -0.9796                          -0.9441
              -0.9952                          -0.9771
              -0.2028                          0.08971
              0.03823                          0.00155
              -0.4043                           -0.191

  : Table continues below

  ------------------------------------------------------------------------
  frequencybodyacceleratormeanz frequencybodyacceleratorstandard-deviation
                                                    x
  ----------------------------- ------------------------------------------
             -0.8827                             -0.9244

             -0.9592                             -0.9764

             -0.9853                              -0.996

             -0.3316                             -0.3191

             -0.2256                             0.02433

             -0.4333                             -0.3374
  ------------------------------------------------------------------------

  : Table continues below

   frequencybodyacceleratorstandard-deviationy
  ---------------------------------------------
                     -0.8336
                     -0.9173
                     -0.9723
                     0.05604
                     -0.113
                     0.02177

  : Table continues below

   frequencybodyacceleratorstandard-deviationz
  ---------------------------------------------
                     -0.8129
                     -0.9345
                     -0.9779
                     -0.2797
                     -0.2979
                     0.08596

  : Table continues below

   frequencybodyacceleratormeanfreqx    frequencybodyacceleratormeanfreqy
  ------------------------------------ ------------------------------------
                -0.1588                              0.09753
                -0.04951                             0.07595
                0.08652                               0.1175
                -0.2075                               0.1131
                -0.3074                              0.06322
                -0.4187                              -0.1607

  : Table continues below

   frequencybodyacceleratormeanfreqz    frequencybodyacceleratorjerkmeanx
  ------------------------------------ ------------------------------------
                0.08944                              -0.9571
                 0.2388                              -0.9866
                 0.2449                              -0.9946
                0.04973                              -0.1705
                 0.2943                              -0.02766
                -0.5201                              -0.4799

  : Table continues below

   frequencybodyacceleratorjerkmeany    frequencybodyacceleratorjerkmeanz
  ------------------------------------ ------------------------------------
                -0.9225                              -0.9481
                -0.9816                              -0.9861
                -0.9854                              -0.9908
                -0.03523                              -0.469
                -0.1287                              -0.2883
                -0.4134                              -0.6855

  : Table continues below

   frequencybodyacceleratorjerkstandard-deviationx
  -------------------------------------------------
                       -0.9642
                       -0.9875
                       -0.9951
                       -0.1336
                      -0.08633
                       -0.4619

  : Table continues below

   frequencybodyacceleratorjerkstandard-deviationy
  -------------------------------------------------
                       -0.9322
                       -0.9825
                       -0.987
                       0.1067
                       -0.1346
                       -0.3818

  : Table continues below

   frequencybodyacceleratorjerkstandard-deviationz
  -------------------------------------------------
                       -0.9606
                       -0.9883
                       -0.9923
                       -0.5347
                       -0.4017
                       -0.726

  : Table continues below

  -------------------------------------------------------------------------
  frequencybodyacceleratorjerkmeanfreq frequencybodyacceleratorjerkmeanfreq
                   x                                    y
  ------------------------------------ ------------------------------------
                 0.1324                              0.02451

                 0.2566                              0.04754

                 0.3142                              0.03916

                -0.2093                              -0.3862

                -0.2532                              -0.3376

                 -0.377                              -0.5095
  -------------------------------------------------------------------------

  : Table continues below

   frequencybodyacceleratorjerkmeanfreqz    frequencybodygryoscopemeanx
  ---------------------------------------- -----------------------------
                  0.02439                             -0.8502
                  0.09239                             -0.9762
                   0.1386                             -0.9864
                  -0.1855                             -0.339
                  0.009372                            -0.3524
                  -0.5511                             -0.4926

  : Table continues below

   frequencybodygryoscopemeany    frequencybodygryoscopemeanz
  ------------------------------ ------------------------------
             -0.9522                        -0.9093
             -0.9758                        -0.9513
              -0.989                        -0.9808
             -0.1031                        -0.2559
             -0.0557                        -0.03187
             -0.3195                        -0.4536

  : Table continues below

   frequencybodygryoscopestandard-deviationx
  -------------------------------------------
                    -0.8823
                    -0.9779
                    -0.9875
                    -0.5167
                    -0.4954
                    -0.5659

  : Table continues below

   frequencybodygryoscopestandard-deviationy
  -------------------------------------------
                    -0.9512
                    -0.9623
                    -0.9871
                   -0.03351
                    -0.1814
                    0.1515

  : Table continues below

  ------------------------------------------------------------------------
  frequencybodygryoscopestandard-deviationz frequencybodygryoscopemeanfreq
                                                          x
  ----------------------------------------- ------------------------------
                   -0.9166                            -0.003547

                   -0.9439                              0.1892

                   -0.9823                             -0.1203

                   -0.4366                             0.01478

                   -0.2384                             -0.1005

                   -0.5717                             -0.1875
  ------------------------------------------------------------------------

  : Table continues below

   frequencybodygryoscopemeanfreqy    frequencybodygryoscopemeanfreqz
  ---------------------------------- ----------------------------------
               -0.09153                           0.01046
               0.06313                            -0.02978
               -0.04472                            0.1006
               -0.06577                          0.0007733
               0.08255                            -0.07568
               -0.4736                            -0.1334

  : Table continues below

   frequencybodyacceleratormagnitudemean
  ---------------------------------------
                  -0.8618
                  -0.9478
                  -0.9854
                  -0.1286
                  0.09658
                  -0.3524

  : Table continues below

   frequencybodyacceleratormagnitudestandard-deviation
  -----------------------------------------------------
                         -0.7983
                         -0.9284
                         -0.9823
                         -0.398
                         -0.1865
                         -0.4163

  : Table continues below

   frequencybodyacceleratormagnitudemeanfreq
  -------------------------------------------
                    0.08641
                    0.2367
                    0.2846
                    0.1906
                    0.1192
                   -0.09774

  : Table continues below

   frequencybodybodyacceleratorjerkmagnitudemean
  -----------------------------------------------
                      -0.9333
                      -0.9853
                      -0.9925
                     -0.05712
                      0.02622
                      -0.4427

  : Table continues below

   frequencybodybodyacceleratorjerkmagnitudestandard-deviation
  -------------------------------------------------------------
                             -0.9218
                             -0.9816
                             -0.9925
                             -0.1035
                             -0.1041
                             -0.5331

  : Table continues below

   frequencybodybodyacceleratorjerkmagnitudemeanfreq
  ---------------------------------------------------
                        0.2664
                        0.3519
                        0.4222
                        0.09382
                        0.07649
                        0.08535

  : Table continues below

   frequencybodybodygryoscopemagnitudemean
  -----------------------------------------
                   -0.8622
                   -0.9584
                   -0.9846
                   -0.1993
                   -0.1857
                   -0.326

  : Table continues below

   frequencybodybodygryoscopemagnitudestandard-deviation
  -------------------------------------------------------
                          -0.8243
                          -0.9322
                          -0.9785
                          -0.321
                          -0.3984
                          -0.183

  : Table continues below

   frequencybodybodygryoscopemagnitudemeanfreq
  ---------------------------------------------
                     -0.1398
                   -0.0002622
                    -0.02861
                     0.2688
                     0.3496
                     -0.2193

  : Table continues below

   frequencybodybodygryoscopejerkmagnitudemean
  ---------------------------------------------
                     -0.9424
                     -0.9898
                     -0.9948
                     -0.3193
                     -0.282
                     -0.6347

  : Table continues below

   frequencybodybodygryoscopejerkmagnitudestandard-deviation
  -----------------------------------------------------------
                            -0.9327
                            -0.987
                            -0.9947
                            -0.3816
                            -0.3919
                            -0.6939

  : Table continues below

   frequencybodybodygryoscopejerkmagnitudemeanfreq
  -------------------------------------------------
                       0.1765
                       0.1848
                       0.3345
                       0.1907
                        0.19
                       0.1143

  : Table continues below

  ------------------------------------------------------------------------
  angletbodyacceleratormeangravity angletbodyacceleratorjerkmeangravitymea
                                                      n
  -------------------------------- ---------------------------------------
              0.02137                              0.00306

              0.02744                              0.02971

             -0.0002223                            0.02196

              0.06045                             -0.00793

             -0.002695                             0.08993

              0.09609                             -0.06108
  ------------------------------------------------------------------------

  : Table continues below

  ------------------------------------------------------------------------
  angletbodygryoscopemeangravitymean angletbodygryoscopejerkmeangravitymea
                                                       n
  ---------------------------------- -------------------------------------
              -0.001667                             0.08444

                0.0677                             -0.06488

               -0.03379                            -0.02792

               0.01306                             -0.01874

               0.06334                             -0.03998

               -0.1947                              0.06568
  ------------------------------------------------------------------------

  : Table continues below

   anglexgravitymean    angleygravitymean    anglezgravitymean
  -------------------- -------------------- --------------------
         0.4267              -0.5203              -0.3524
        -0.5912              -0.06047              -0.218
        -0.7434               0.2702              0.01225
        -0.7292               0.277               0.06886
        -0.7445               0.2672               0.065
        -0.6472               0.3348              0.07417
