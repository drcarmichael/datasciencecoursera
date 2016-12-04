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

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

q2 <- select(NEI,fips,Emissions,year) %>% filter(fips == "24510") %>% group_by(year) %>% summarise(sum=sum(Emissions))

png("plot2.png",height=480,width=600,bg="wheat")
barplot(q2$sum, names.arg = q2$year, col=colq1, xlab="Years",
  ylab = "PM2.5 Particulates Measured in Tons",
  main="Total PM2.5 Emissions (Baltimore City, MD) from 1999-2008",
  sub=("Overall Reduction"))
dev.off()

