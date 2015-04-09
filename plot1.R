# Read in file
raw.data <- read.csv("household_power_consumption.txt", sep=";")

# Convert date column and Global_active_power column
raw.data$Date <- as.Date(raw.data$Date, "%d/%m/%Y")
raw.data$Global_active_power <- as.numeric(as.character(raw.data$Global_active_power))

# Subset by date
subsetted.data1 <- subset(raw.data, raw.data$Date == as.Date("01/02/2007", "%d/%m/%Y"))
subsetted.data2 <- subset(raw.data, raw.data$Date == as.Date("02/02/2007", "%d/%m/%Y"))
subsetted.data <- rbind(subsetted.data1, subsetted.data2)

# Open file
png("plot1.png", width=480, height=480)

# Write plot to file
hist(subsetted.data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col="orangered")

# Close file
dev.off()
