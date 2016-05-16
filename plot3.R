#plot3
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
powercon$Sub_metering_1 <- as.numeric(as.character(powercon$Sub_metering_1))
powercon$Sub_metering_2 <- as.numeric(as.character(powercon$Sub_metering_2))
powercon$Sub_metering_3 <- as.numeric(as.character(powercon$Sub_metering_3))
plot(powercon$datetime,powercon$Sub_metering_1,type="l", ylim=c(0,40), col="black")
par(new=T)
powercon$Sub_metering_2 <- as.numeric(levels(powercon$Sub_metering_2)[powercon$Sub_metering_2])
plot(powercon$datetime,powercon$Sub_metering_2,type="l", ylim=c(0,40), col="red")
par(new=T)
plot(powercon$datetime,powercon$Sub_metering_3,type="l", ylim=c(0,40), col="blue")
legend('topright', legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1), bty = "l")
#save plot 3 as a png
#dev.copy(png, "plot3.png")
#dev.off()