data <- read.csv(
    'data/household_power_consumption.txt',
    na.strings = "?", sep=";",
    colClasses = c("character", "character", rep("numeric", 7))
)

data <- with(data, subset(data, Date == '1/2/2007' | Date == '2/2/2007'))

png(file = "plot1.png")

hist(
    data$Global_active_power,
    col = "red",
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)"
)

dev.off()