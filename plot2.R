namesData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)

subsetData <- read.table("household_power_consumption.txt", sep=";",na.strings=c("NA","?"), skip=66637, nrows=2880)

# Assign names to the data frame to clean it up
names(subsetData) <- names(namesData)

dates <- paste(subsetData$Date, subsetData$Time)
datetime <- strptime(dates, "%d/%m/%Y %H:%M:%S")

# Second plot
par(mfrow=c(1,1))
plot(datetime, subsetData$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)")

# Save to file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()