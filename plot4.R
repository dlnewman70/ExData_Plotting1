namesData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)

subsetData <- read.table("household_power_consumption.txt", sep=";",na.strings=c("NA","?"), skip=66637, nrows=2880)
# Assign names to the data frame
names(subsetData) <- names(namesData)

# Create a new array for an actual date object
dates <- paste(subsetData$Date, subsetData$Time)
datetime <- strptime(dates, "%d/%m/%Y %H:%M:%S")

# Make two rows and two columns
par(mfrow=c(2,2))

# First plot - much like plot1.R except the x-axis is different
plot(datetime, subsetData$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)")

# Second plot - Plotting the voltage
plot(datetime, subsetData$Voltage, type="l", ylab="Voltage",xlab="datetime")

# Third plot - exactly like plot3.R
plot(datetime, subsetData$Sub_metering_1, type="l",xlab="", ylab="Energy sub metering", col="black")
lines(datetime, subsetData$Sub_metering_2, col="red")
lines(datetime, subsetData$Sub_metering_3, col="blue") 
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Fourth plot - Plot the global inactive power
plot(datetime, subsetData$Global_reactive_power, cex=0.95, type="l",ylab="Global_reactive_power", xlab="datetime", xaxt="n")

# Save to file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()