# Figure 2: 
# Load data from working directory 
# Convert data types 
# Subset data 
# Plot line chart of Global Active Power in Kilowatts 

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

#powersubset$Time <- format(powersubset$Time, format = "%H:%M:%S")
#power$Date <- as.Date(powersubset$Date, format = "%d/%m/%Y")

# generate plot 
png("plot2.png", width = 480, height = 480)
with(powersubset, plot(datetime, Global_active_power, type = "l", xlab = "Day", ylab = "Global Active Power (kilowatts)"))

dev.off()

