### Exploratory Data Analysis - Course project 1

# Download data from file and unpack zip in working directoy.Load data set into R

epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Select the rows between dates 2007-02-01 and 2007-02-02

epcdates <- epc[as.character(epc$Date) %in% c("1/2/2007", "2/2/2007"),]


# Combine date and time variables 

library(lubridate)
epcdates$datetime<- paste(epcdates$Date,epcdates$Time)
epcdates$datetime<-dmy_hms(epcdates$datetime)

### Plot 2

png("plot2.png")
plot(epcdates$datetime, as.numeric(as.character(epcdates$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

