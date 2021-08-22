# Figure 3: 
# Load data from working directory 
# Convert data types 
# Subset data 
# Plot line chart of Global Active Power in Kilowatts by Sub_metering

# Read in data from working directory 
powerraw <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")

# add datetime column to dataset for line plot 
datetime <- strptime(paste(powerraw$Date, powerraw$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
power <- cbind(powerraw, datetime)

# subset data to dates of interest
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
powersubset <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")

# convert data types 
powersubset$Global_active_power <- as.numeric(powersubset$Global_active_power) 
powersubset$Sub_metering_1 <- as.numeric(powersubset$Sub_metering_1)
powersubset$Sub_metering_2 <- as.numeric(powersubset$Sub_metering_2)
powersubset$Sub_metering_3 <- as.numeric(powersubset$Sub_metering_3)

# generate plot 
png("plot3.png", width = 480, height = 480)
with(powersubset, plot(datetime, Sub_metering_1, type = "l", xlab="Day", ylab="Energy sub meeting"))
lines(powersubset$datetime, powersubset$Sub_metering_2, type = "l", col = "red")
lines(powersubset$datetime, powersubset$Sub_metering_3, type = "l", col = "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()

