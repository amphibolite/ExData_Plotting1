#Author: John Kenneth Velonta

png(filename="plot2.png", width=480, height=480)

PowerCon <- read.delim("household_power_consumption.txt", sep=";", header=TRUE)

FilteredPowerCon <- subset(PowerCon, (Date=="1/2/2007" | Date=="2/2/2007") & Global_active_power!="?")
FilteredPowerCon$Date <- as.Date(FilteredPowerCon$Date, format="%d/%m/%Y")
FilteredPowerCon$DateTime <- paste(FilteredPowerCon$Date,FilteredPowerCon$Time)
FilteredPowerCon$DateTime <- as.POSIXct(FilteredPowerCon$DateTime)

with(FilteredPowerCon, plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.off()