## Read household_power_consumption.txt data
prjData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("?"))

## Take a subset of the data for 2007-02-01 and 2007-02-02
prjDataDate <- as.Date(as.character(prjData$Date), "%d/%m/%Y")
prjDataSub <- subset(prjData, prjDataDate == as.Date("2007-02-01") | prjDataDate == as.Date("2007-02-02"))

## Date formatting
prjDataDtTm <- strptime(paste(prjDataSub$Date, prjDataSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## plot4.png
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(prjDataDtTm, prjDataSub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(prjDataDtTm, prjDataSub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(prjDataDtTm, prjDataSub$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(prjDataDtTm,prjDataSub$Sub_metering_1, col = "black")
lines(prjDataDtTm,prjDataSub$Sub_metering_2, col = "red")
lines(prjDataDtTm,prjDataSub$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), lty = 1, bty = "n")
plot(prjDataDtTm, prjDataSub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()