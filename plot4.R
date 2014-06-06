## plot4.R
## Load the needed libraries
library(graphics)
library(grDevices)

## Set up "classes" character vector with length of 9; the number of columns in the dataset
classes <- rep(c("character"), 9)

## Read in the household power consumption dataset
data1 <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses = classes)

## Convert the "Date" column from character to date format
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

## Subset the dataset only to include dates "2007-2-1" and "2007-2-2"
dataplot <- subset(data1,(data1$Date == "2007-2-1" | data1$Date == "2007-2-2"))

## Convert columns 3 to 9 to numeric
for ( i in (3:9)) {
dataplot[,i] <- as.numeric(dataplot[,i])
}

## Combine Date and Time columns to vector x
x <- paste(dataplot$Date, dataplot$Time)
x <- strptime(x, "%Y-%m-%d %H:%M:%S")

## plot the graphs and save it to "plot4.png" 
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(dataplot, {
plot(x, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
plot(x, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(x, Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(x, Sub_metering_2, type = "l", col = "red")
lines(x, Sub_metering_3, type = "l", col = "blue")
legend("topright", lty =1 , lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(x, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.off()
