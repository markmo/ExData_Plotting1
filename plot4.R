# read from file - "Individual household electric power consumption Data Set"
consumption <- read.table("data/household_power_consumption.txt", header=T, sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), nrows=2075260, na.strings="?", fill=T)
# only interested in date range 1/2/2007 - 2/2/2007
range <- consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007", ]
# convert the concatenation of the character date and time columns to a POSIXlt datetime class
dates <- strptime(paste(range$Date, range$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# output to a png file
png(file="plot4.png", width=480, height=480)

# create a graphic with 2x2 plots in row order
par(mfrow = c(2, 2))

with(range, {
  # top-left quadrant - line plot of Global Active Power by time
  plot(dates, Global_active_power, type="l", xlab="", ylab="Global Active Power")

  # top-right - line plot of Voltage by time
  plot(dates, Voltage, type="l", xlab="datetime")

  # bottom-left - multi-series line plot of power consumption by sub-meter by time
  plot(dates, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
  lines(dates, Sub_metering_2, col="red")
  lines(dates, Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1, 1), col=c("black", "red", "blue"), bty="n", cex=0.9)

  # bottom-right - line plot of Global Reactive Power by time
  plot(dates, Global_reactive_power, type="l", xlab="datetime")
})

dev.off()
