library(ggplot2)
library(dplyr)
library(tidyr)

# PM2.5 Emissions Data (𝚜𝚞𝚖𝚖𝚊𝚛𝚢𝚂𝙲𝙲_𝙿𝙼𝟸𝟻.𝚛𝚍𝚜): This file contains a data frame with all of the PM2.5 
# emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons 
# of PM2.5 emitted from a specific type of source for the entire year. 
# 𝚏𝚒𝚙𝚜: A five-digit number (represented as a string) indicating the U.S. county
# 𝚂𝙲𝙲: The name of the source as indicated by a digit string (see source code classification table)
# 𝙿𝚘𝚕𝚕𝚞𝚝𝚊𝚗𝚝: A string indicating the pollutant
# 𝙴𝚖𝚒𝚜𝚜𝚒𝚘𝚗𝚜: Amount of PM2.5 emitted, in tons
# 𝚝𝚢𝚙𝚎: The type of source (point, non-point, on-road, or non-road)
# 𝚢𝚎𝚊𝚛: The year of emissions recorded
# Source Classification Code Table (𝚂𝚘𝚞𝚛𝚌𝚎_𝙲𝚕𝚊𝚜𝚜𝚒𝚏𝚒𝚌𝚊𝚝𝚒𝚘𝚗_𝙲𝚘𝚍𝚎.𝚛𝚍𝚜): This table provides a 
# mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. 
# The sources are categorized in a few different ways from more general to more specific and 
# you may choose to explore whatever categories you think are most useful. 
# For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 1 - Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

q1 <- select(NEI,Emissions,year) %>% group_by(year) %>% summarise(sum=sum(Emissions))
#colq1 <- c("magenta","maroon","mediumaquamarine","mediumblue")
colq1 <- c("blue4","blue3","blue2","blue1")

png("plot1.png",height=480,width=600,bg="wheat")
barplot(q1$sum/10^6, names.arg = q1$year, col=colq1, xlab="Years",
  ylab = "PM2.5 Particulates Measured in Millions of Tons",
  main="Total US PM2.5 Emissions Reduced from 1999-2008")
dev.off()
print("Plot1")
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

q2 <- select(NEI,fips,Emissions,year) %>% filter(fips == "24510") %>% group_by(year) %>% summarise(sum=sum(Emissions))

png("plot2.png",height=480,width=600,bg="wheat")
barplot(q2$sum, names.arg = q2$year, col=colq1, xlab="Years",
  ylab = "PM2.5 Particulates Measured in Tons",
  main="Total PM2.5 Emissions (Baltimore City, MD) from 1999-2008",
  sub=("Overall Reduction"))
dev.off()
print("Plot2")

# Q3 Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions from 1999–2008 for 
# Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 
# plotting system to make a plot answer this question.

q3 <- filter(NEI,fips == "24510")  %>% group_by(type,year) %>% summarise(tot=sum(Emissions))
q3p <- ggplot(q3, aes(x = year, y=tot, color=type)) + geom_line(size=2) + 
   xlab("YEAR") + ylab("PM2.5 Emission Totals (in TONS)") +
   ggtitle("PM 2.5 Trends, by type of PM2.5 Emission for Baltimore City, MD") +
   geom_text(aes(2004,110,label="trend down"),color="lightblue") +
   geom_text(aes(2005,1000,label="trend up"),color="purple") +
   geom_text(aes(2005,220,label="trend down"),color="lightgreen") +
   geom_text(aes(2007,1400,label="trend down"),color="brown")  +
   theme(panel.background=element_rect(fill="wheat"))

#ggsave("plot3.png",plot=q6p,device="png",width=4.35,height=6,units="in",dpi=300)
png("plot3.png",height=480,width=600)
print(q3p)
dev.off()
print("Plot3")

#q3a <- spread(q3,type,tot)

#Question 4 Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?
#
# Select Combustable Coal Sectors
#
filt <- filter(SCC, grepl("comb",EI.Sector,ignore.case=TRUE) & grepl("coal",EI.Sector,ignore.case=TRUE))
cclist <- filt$SCC
q4 <- filter(NEI, SCC %in% cclist) %>% group_by(type,year) %>% summarize(tot=sum(Emissions))
q4a <- filter(NEI, SCC %in% cclist) %>% group_by(year) %>% summarize(tot=sum(Emissions))
type <- rep('TOTAL',4)
q4b <- cbind(type,q4a)
q4c <- union(q4,q4b)

q4p <- ggplot(q4c, aes(x = year, y=tot/1000, color=type)) + geom_line(size=2) +
   xlab("YEAR") + ylab("PM2.5 Emissions (in Kilotons)") + 
   ggtitle("US Coal-Combustion Related Emmisions") +
   geom_text(aes(2005,580,label="sharp trend down"),color="blue") +
   geom_text(aes(2005,510,label="sharp trend down "),color="darkgreen") +
   geom_text(aes(2005,90,label="overall trend down"),color="red")  + 
   theme(panel.background=element_rect(fill="wheat"))

#ggsave("plot4.png",plot=q4p,device="png",width=4.35,height=6,units="in",dpi=300)
png("plot4.png",height=480,width=600)
print(q4p)
dev.off()
print("Plot4")
#
# question 5 
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
#  this comes down to ON-ROAD as an intpretation. looking in the SCC file, genertates (essentially)
#  the same numbers as just  taking the data from  the NEI file, using ON-ROAD
#
q5 <- filter(NEI, type == "ON-ROAD" & fips == "24510" ) %>% group_by(year) %>% summarize(tot=sum(Emissions))

q5p <- ggplot(q5, aes(x = as.factor(year), y = tot, fill =year, label = round(tot,2) ))  +
  geom_bar( stat="identity")  + geom_label(aes(fill=year), color="gold", fontface="bold") +
  xlab("YEAR") + ylab("PM2.5 Emissions (in Tons)") +
  ggtitle("PM 2.5 Motor Vehicle Emissions Trends for Baltimore City, MD") +
  theme(panel.background=element_rect(fill="wheat"))

#ggsave("plot5.png",plot=q5p,device="png",width=4.35,height=6,units="in",dpi=300)
png("plot5.png",height=480,width=600)
print(q5p)
dev.off()
print("Plot5")

#
# Question 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from 
# motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). 
# Which city has seen greater changes over time in motor vehicle emissions?

q6 <- filter(NEI, type == "ON-ROAD" & (fips == "24510" | fips == "06037")) %>% 
  group_by(fips,year) %>% summarise(tot=sum(Emissions))
colnames(q6) <- c("City","Year","tot")
q6$City[q6$City=="06037"] <- "Los Angles,CA"
q6$City[q6$City=="24510"] <- "Baltimore City,MD"
#
#
q6p <- ggplot(q6, aes(x = Year, y=tot, color=City)) + geom_line(size=2) +
   xlab("YEAR") + ylab("PM2.5 Emission Totals (in TONS)") +
   ggtitle("PM 2.5 ON ROAD Emission Comparison Between \n Los Angles, CA / Baltimore City, MD") +
   geom_text(aes(2004,4400,label="trend up"),color="blue") +
   geom_text(aes(2004,300,label="trend down"),color="red") +
   theme(panel.background=element_rect(fill="wheat"))

#ggsave("plot6.png",plot=q6p,device="png",width=4.35,height=6,units="in",dpi=300)
png("plot6.png",height=480,width=600)
print(q6p)
dev.off()
print("Plot6")
