# Figure 1: 
# Load data from working directory 
# Convert data types 
# Subset data 
# Plot histogram of Global Active Power in Kilowatts

# Read in data from working directory 
power <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")

# convert data types 
power$Global_active_power <- as.numeric(power$Global_active_power) 
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# subset data to dates of interest
powersubset <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")

# generate plot 
png("plot1.png", width = 480, height = 480)
hist(powersubset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
