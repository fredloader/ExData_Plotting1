## plot1.R
## Load the needed libraries
library(graphics)
library(grDevices)

## Set up "classes" character vector with length of 9; the number of columns in the dataset
classes <- rep(c("character"), 9)

## Read in the household power consumption dataset
data1 <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses = classes)

## Convert the "Date" column from character to date format
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

## Subset the dataset only to dates "2007-2-1" and "2007-2-2"
dataplot <- subset(data1,(data1$Date == "2007-2-1" | data1$Date == "2007-2-2"))

## Convert columns 3 to 9 to numeric
for ( i in (3:9)) {
dataplot[,i] <- as.numeric(dataplot[,i])
}

## Plot the histogram and save to "plot1.png"
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(dataplot$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
