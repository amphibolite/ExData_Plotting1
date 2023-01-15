#Author: John Kenneth Velonta

png(filename="plot1.png", width=480, height=480)

PowerCon <- read.delim("household_power_consumption.txt", sep=";", header=TRUE)

FilteredPowerCon <- subset(PowerCon, (Date=="1/2/2007" | Date=="2/2/2007") & Global_active_power!="?")

hist(as.numeric(FilteredPowerCon$Global_active_power), col="red", main="Global Active Power", 
     xlab= "Global Active Power (kilowatts)")

dev.off()

