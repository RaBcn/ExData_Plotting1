
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = fileUrl,destfile = "household_power_consumption.zip")
unzip(zipfile = "household_power_consumption.zip")

# Read file 
t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
t$Date <- as.Date(t$Date, "%d/%m/%Y")
# subset just the data needed
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
# remove incomplete rows
t <- t[complete.cases(t),]

## Combine Date and Time column
dateTime <- paste(t$Date, t$Time)

## Format dateTime Column
t$dateTime <- as.POSIXct(dateTime)

# Create Plot 1
hist(t$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
