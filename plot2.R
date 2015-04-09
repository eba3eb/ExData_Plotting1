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

# Open file
png("plot2.png", width=480, height=480)

# Write plot to file
plot(x = dates, y = subsetted.data$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")

# Close file
dev.off()
