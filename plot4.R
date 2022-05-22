## Exploratory Data Analysis, Peer-reviewed project 1

## Plot 4

## Getting data
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
data <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007") ## days of interest

## transforming necessary data
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") ## transform time into datetime for convenience
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

## Set plot layout
par(mfcol = c(2,2))

## Plot 1
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Plot 2
plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), 
       col = c("black", "red", "blue"), 
       legend = colnames(data)[7:9])

## Plot 3
with(data, plot(Time, Voltage, type = "l", xlab = "datetime")) ## added label to match assignment pic, I used different column names

## Plot 4
with(data, plot(Time, Global_reactive_power, type = "l", xlab = "datetime"))

## Save plot as .png
dev.copy(png, filename = "plot4.png")
dev.off()