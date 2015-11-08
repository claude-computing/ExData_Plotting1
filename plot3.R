data <- read.csv(
    'data/household_power_consumption.txt',
    na.strings = "?", sep=";",
    colClasses = c("character", "character", rep("numeric", 7))
)

data <- with(data, subset(data, Date == '1/2/2007' | Date == '2/2/2007'))

dates <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png")

plot(dates, data$Sub_metering_1, type = "n",
     xlab = "", ylab = "Energy sub metering")

points(dates, data$Sub_metering_1, type = "l")
points(dates, data$Sub_metering_2, type = "l", col = "red")
points(dates, data$Sub_metering_3, type = "l", col = "blue")

legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))

dev.off()