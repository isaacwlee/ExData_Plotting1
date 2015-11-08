## Read household_power_consumption.txt data
prjData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("?"))

## Take a subset of the data for 2007-02-01 and 2007-02-02
prjDataDate <- as.Date(as.character(prjData$Date), "%d/%m/%Y")
prjDataSub <- subset(prjData, prjDataDate == as.Date("2007-02-01") | prjDataDate == as.Date("2007-02-02"))

## Date formatting
prjDataDtTm <- strptime(paste(prjDataSub$Date, prjDataSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## plot2.png
png(filename = "plot2.png", width = 480, height = 480)
plot(prjDataDtTm, prjDataSub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()