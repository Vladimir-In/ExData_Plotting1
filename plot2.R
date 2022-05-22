## Exploratory Data Analysis, Peer-reviewed project 1

## Plot 2

## Getting data
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
data <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007") ## days of interest

## transforming necessary data
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") ## transform time into datetime for convenience

## Making plot
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


## Save plot as .png
dev.copy(png, filename = "plot2.png")
dev.off()