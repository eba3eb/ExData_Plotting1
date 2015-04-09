# Read in file
raw.data <- read.csv("household_power_consumption.txt", sep=";")

# Convert columns to relevant datatypes
raw.data$Date <- as.Date(raw.data$Date, "%d/%m/%Y")
raw.data$Datetime <- paste(raw.data$Date, raw.data$Time, sep=" ")
raw.data$Datetime <- strptime(raw.data$Datetime, "%Y-%m-%d %H:%M:%S")
raw.data$Datetime <- as.POSIXlt(raw.data$Datetime)
raw.data$Global_active_power <- as.numeric(as.character(raw.data$Global_active_power))

# Subset by date
subsetted.data1 <- subset(raw.data, raw.data$Date == as.Date("01/02/2007", "%d/%m/%Y"))
subsetted.data2 <- subset(raw.data, raw.data$Date == as.Date("02/02/2007", "%d/%m/%Y"))
subsetted.data <- rbind(subsetted.data1, subsetted.data2)

# Get date column
dates <- subsetted.data$Datetime

# Convert columns to relevant datatypes part 2
subsetted.data$Sub_metering_1 <- as.numeric(as.character(subsetted.data$Sub_metering_1))
subsetted.data$Sub_metering_2 <- as.numeric(as.character(subsetted.data$Sub_metering_2))
subsetted.data$Sub_metering_3 <- as.numeric(as.character(subsetted.data$Sub_metering_3))

# Open file
png("plot3.png", width=480, height=480)

# Write plot to file
plot(x = dates, y = subsetted.data$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(x=dates, y=subsetted.data$Sub_metering_2, col="red")
lines(x=dates, y=subsetted.data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= c(1,1,1), col=c("black","red", "blue"))

# Close file
dev.off();