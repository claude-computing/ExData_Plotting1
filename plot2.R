data <- read.csv(
    'data/household_power_consumption.txt',
    na.strings = "?", sep=";",
    colClasses = c("character", "character", rep("numeric", 7))
)

data <- with(data, subset(data, Date == '1/2/2007' | Date == '2/2/2007'))

dates <- strptime(
    paste(data$Date, data$Time),
    "%d/%m/%Y %H:%M:%S"
)

png(file = "plot2.png")

plot(
    dates,
    data$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
)

dev.off()