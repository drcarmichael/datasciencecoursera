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
