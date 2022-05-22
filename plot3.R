## Exploratory Data Analysis, Peer-reviewed project 1

## Plot 3

## Getting data
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
data <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007") ## days of interest

## transforming necessary data
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") ## transform time into datetime for convenience
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)


## Making plot
plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), 
       col = c("black", "red", "blue"), 
       legend = colnames(data)[7:9])

## Save plot as .png
dev.copy(png, filename = "plot3.png")
dev.off()