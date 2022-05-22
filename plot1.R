## Exploratory Data Analysis, Peer-reviewed project 1

## Plot 1

## Data
rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
data <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007") ## days of interest
data$Global_active_power <- as.numeric(data$Global_active_power) ## transforming necessary data

## Making plot
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Save plot as .png
dev.copy(png, filename = "plot1.png")
dev.off()
