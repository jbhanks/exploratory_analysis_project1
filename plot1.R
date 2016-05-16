#plot1
setwd("C:/Users/homepc/Dropbox/Labshare/UJames/Coursera/data_science/exploratory_data_analysis/plothw")
unzip ("exdata-data-household_power_consumption.zip")
powercon <- read.csv("household_power_consumption.txt", sep=";")
powercon$Global_active_power <- as.numeric(as.character(powercon$Global_active_power))
powercon <- powercon[powercon$Date %in% c("1/2/2007","2/2/2007") ,]
hist(powercon$Global_active_power, breaks=seq(0,12, by=0.5), xlim=c(0,6), xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", main ="Global Active Power")
#save plot 1 as a png
dev.copy(png, "plot1.png")
dev.off()
