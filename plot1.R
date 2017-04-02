# read data file
namesData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)

subsetData <- read.table("household_power_consumption.txt", sep=";",na.strings=c("NA","?"),skip=66637,nrows=2880)

# Assign names to the data frame to clean it up
names(subsetData) <- names(namesData)

# plot1
par(mfrow=c(1,1))
hist(subsetData$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# Save to file
dev.copy(png, file="plot1.png", width=480, height=480)

dev.off()