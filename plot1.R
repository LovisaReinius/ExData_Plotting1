### Exploratory Data Analysis - Course project 1

# Download data from file and unpack zip in working directoy.Load data set into R

epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Clean the date data

epc$Date <- as.Date(epc$Date,"%d/%m/%Y")

library(lubridate)
epc$Time <- hms(epc$Time) 


# Select the rows between dates 2007-02-01 and 2007-02-02

epcdates <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")


### Plot 1: Histogram

png(filename = "plot1.png")
hist(epcdates$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()






