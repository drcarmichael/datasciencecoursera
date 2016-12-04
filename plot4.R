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
