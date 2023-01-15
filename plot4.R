#Author: John Kenneth Velonta

png(filename="plot4.png", width=480, height=480)

PowerCon <- read.delim("household_power_consumption.txt", sep=";", header=TRUE)

FilteredPowerCon <- subset(PowerCon, (Date=="1/2/2007" | Date=="2/2/2007") & Global_active_power!="?")
FilteredPowerCon$Date <- as.Date(FilteredPowerCon$Date, format="%d/%m/%Y")
FilteredPowerCon$DateTime <- paste(FilteredPowerCon$Date,FilteredPowerCon$Time)
FilteredPowerCon$DateTime <- as.POSIXct(FilteredPowerCon$DateTime)

par(mfrow=c(2,2))

#Plot1
with(FilteredPowerCon, plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

#Plot2
with(FilteredPowerCon, plot(Voltage~DateTime, type="l", ylab="Voltage", xlab="datetime"))

#Plot3
with(FilteredPowerCon, plot(Sub_metering_1~DateTime, type="l", col="black", ylab="Energy sub metering", xlab=""))
points(FilteredPowerCon$DateTime, FilteredPowerCon$Sub_metering_2, col="red", type="l")
points(FilteredPowerCon$DateTime, FilteredPowerCon$Sub_metering_3, col="blue", type="l")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot4
with(FilteredPowerCon, plot(Global_reactive_power~DateTime, type="l", ylab="Global_reactive_power", xlab="datetime"))

dev.off()