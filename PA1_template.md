---
title: "Reproducible Research: Peer Assessment 1"
author: "Martin Carmichael"
output: 
  html_document:
    keep_md: true
---


## Loading and preprocessing the data
Program Assignment Start   

Begin by loading  the libraries, reading the data file, then set up the names we will be using. We also will convert the dates to date format and add a data field (day) which identifies weekdays and weekends


```r
library(lubridate)
```

```
## Loading required package: methods
```

```
## 
## Attaching package: 'lubridate'
```

```
## The following object is masked from 'package:base':
## 
##     date
```

```r
library(ggplot2)
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:lubridate':
## 
##     intersect, setdiff, union
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
data <- read.table(file="/data/course5/RepData_PeerAssessment1/activity.csv",sep=",",comment.char="",quote="",header=TRUE)
```

```
## Warning in file(file, "rt"): cannot open file '/data/course5/
## RepData_PeerAssessment1/activity.csv': No such file or directory
```

```
## Error in file(file, "rt"): cannot open the connection
```

```r
colnames(data) <- c("steps","date","interval")
```

```
## Error in `colnames<-`(`*tmp*`, value = c("steps", "date", "interval")): attempt to set 'colnames' on an object with less than two dimensions
```

```r
data[,'date'] <- ymd(data[,'date'])
```

```
## Error in data[, "date"]: object of type 'closure' is not subsettable
```

```r
data$day <- wday(data[,'date'])
```

```
## Error in data[, "date"]: object of type 'closure' is not subsettable
```

```r
weekend <- c(1,7)
weekday <- c(2,3,4,5,6)
data[data$day %in% weekend,]$day <- "Weekend"
```

```
## Error in data$day: object of type 'closure' is not subsettable
```

```r
data[data$day %in% weekday,]$day <- "Weekday"
```

```
## Error in data$day: object of type 'closure' is not subsettable
```


## What is mean total number of steps taken per day?


The first part of the analysis is to calculate the total number of steps per day.


The project says that we are looking for the mean and the median of the steps taken, on a per day basis. Here, there are a couple of options.  We can take the mean of the sum on a daily basis, which takes the sum of all the intervals, or we can look at it like an interval based mean.



```r
sum1 <- na.omit(data) %>% group_by(date) %>% summarize(sum = sum(steps))
```

```
## Error in UseMethod("group_by_"): no applicable method for 'group_by_' applied to an object of class "function"
```

```r
themean <- mean(sum1$sum)
```

```
## Error in mean(sum1$sum): object 'sum1' not found
```

```r
themean
```

```
## Error in eval(expr, envir, enclos): object 'themean' not found
```

```r
#
# looking at an interval mean rather than daily mean
#
mean1 <- na.omit(data) %>% group_by(date) %>% summarize(means = mean(steps))
```

```
## Error in UseMethod("group_by_"): no applicable method for 'group_by_' applied to an object of class "function"
```

```r
#  which is the same as
mean(mean1$means)
```

```
## Error in mean(mean1$means): object 'mean1' not found
```

```r
meannum <- mean(mean1$means)
```

```
## Error in mean(mean1$means): object 'mean1' not found
```

```r
meannum
```

```
## Error in eval(expr, envir, enclos): object 'meannum' not found
```















