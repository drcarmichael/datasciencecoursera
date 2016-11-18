#
#  Coursera Explotory Analysis Project 1
#  Plot 4
#
library(ggplot2)
library(dplyr)
library(lubridate)
#
#  Download the power data, in a zip, unzip the file, then do the read
#
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="power.zip")
unzip(zipfile="power.zip")
#
# The Read into File In (fin) , from the file downloaded,seperator is a ;. An important
# element is the stringsAsFactors=False, which made the date conversion easier
#
fin <- read.table("household_power_consumption.txt",sep=";",comment.char="",quote="",stringsAsFactors=FALSE,header=TRUE)
#
# Use lubridate for the date processing
#
fin$Datetime <- dmy_hms(paste(fin$Date,fin$Time))
#
# filter is faster than subset
#
data <- filter(fin, Datetime >= dmy("1/2/2007") &  Datetime < dmy("3/2/2007"))
#rm(fin)
#
#  Preparing the data is the same for esentially all the plots
#
data$Global_active_power <- as.numeric(data$Global_active_power)

# plot 4 

# 2 columns 2 rows plots
#
png(file="plot4.png",height=480,width=480)
par(mfrow = c(2,2))
#  Upper left graph
with(data, hist(Global_active_power,main="", xlab="", col="red",ylab="Global Active Power"))
#  Upper Right Graph
with(data, plot(Voltage~Datetime, type='l',ylab="Voltage",xlab="datetime"))
#  Lower Left
with(data, plot(Sub_metering_1~Datetime,xlab="",ylab="Energy sub metering",type='l'))
with(data, lines(Sub_metering_2~Datetime,col="red"))
with(data, lines(Sub_metering_3~Datetime,col="blue"))
legend("topright",lwd=c(2.0,2.0,2.0),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#
# Lower Right
#
with(data, plot(Global_reactive_power~Datetime, type='l',ylab="Global_reactive_power",xlab="datetime"))
dev.off()

#  End Program
