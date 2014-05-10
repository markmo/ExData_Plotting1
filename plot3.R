# read from file - "Individual household electric power consumption Data Set"
consumption <- read.table("data/household_power_consumption.txt", header=T, sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), nrows=2075260, na.strings="?", fill=T)
# only interested in date range 1/2/2007 - 2/2/2007
range <- consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007", ]
# convert the concatenation of the character date and time columns to a POSIXlt datetime class
dates <- strptime(paste(range$Date, range$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# output to a png file
png(file="plot3.png", width=480, height=480)
# multi-series line plot of power consumption by sub-meter by time
plot(dates, range$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(dates, range$Sub_metering_2, col="red")
lines(dates, range$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1, 1), col=c("black", "red", "blue"))
dev.off()
