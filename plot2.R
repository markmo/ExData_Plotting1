# read from file - "Individual household electric power consumption Data Set"
consumption <- read.table("data/household_power_consumption.txt", header=T, sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), nrows=2075260, na.strings="?", fill=T)
# only interested in date range 1/2/2007 - 2/2/2007
range <- consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007", ]
# convert the concatenation of the character date and time columns to a POSIXlt datetime class
dates <- strptime(paste(range$Date, range$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# output to a png file
png(file="plot2.png", width=480, height=480)
# line plot of Global Active Power by time
plot(dates, range$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
