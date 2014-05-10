# read from file - "Individual household electric power consumption Data Set"
consumption <- read.table("data/household_power_consumption.txt", header=T, sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), nrows=2075260, na.strings="?", fill=T)
# only interested in date range 1/2/2007 - 2/2/2007
range <- consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007", ]

# output to a png file
png(file="plot1.png", width=480, height=480)
# histogram of Global Active Power
hist(range$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
