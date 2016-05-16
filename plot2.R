#plot2
#unzip and load the file
setwd("C:/Users/homepc/Dropbox/Labshare/UJames/Coursera/data_science/exploratory_data_analysis/plothw")
#unzip and open the file
unzip ("exdata-data-household_power_consumption.zip")
powercon <- read.csv("household_power_consumption.txt", sep=";")
library(lubridate)
powercon <- powercon[powercon$Date %in% c("1/2/2007","2/2/2007") ,]
Date2 <- as.character(powercon$Date)
Date3 <- Date3 <- dmy(Date2)
Time2 <- as.character(powercon$Time)
Time3 <- hms(Time2)
weekday <- weekdays(as.Date(powercon$Date))
powercon <- cbind(Time3, weekday, Date3, powercon)
datetime <- as.POSIXct(paste(powercon$Date3, powercon$Time), format = "%Y-%m-%d %H:%M:%S")
powercon <- cbind(datetime, powercon)
powercon$Global_active_power <- as.numeric(as.character(powercon$Global_active_power))
plot(powercon$datetime,powercon$Global_active_power,type="l")
#save plot 2 as a png
dev.copy(png, "plot2.png")
dev.off()