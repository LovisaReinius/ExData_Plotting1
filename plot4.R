### Exploratory Data Analysis - Course project 1

# Download data from file and unpack zip in working directoy.Load data set into R

epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Select the rows between dates 2007-02-01 and 2007-02-02

epcdates <- epc[as.character(epc$Date) %in% c("1/2/2007", "2/2/2007"),]


# Combine date and time variables 

library(lubridate)
epcdates$datetime<- paste(epcdates$Date,epcdates$Time)
epcdates$datetime<-dmy_hms(epcdates$datetime)

### Plot 4

png("plot4.png")
par(mfrow=(c(2,2)))
plot(epcdates$datetime, as.numeric(as.character(epcdates$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(epcdates$datetime, epcdates$Voltage,type="l",ylab="Voltage", xlab="datetime")
plot(epcdates$datetime, epcdates$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(epcdates$datetime, epcdates$Sub_metering_2, col="red", type="l")
        lines(epcdates$datetime, epcdates$Sub_metering_3, col="blue", type="l")
        legend("topright", lty=1, bty="n", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))        
plot(epcdates$datetime, epcdates$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()