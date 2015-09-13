# Exploratory Data Analysis project 1
# 9/12/2015

# Load library
library(downloader)

# Create data directory
if (!dir.exists("./data")) {
        dir.create("./data")
}

# Download and unzip data files if not already downloaded
if (!file.exists("./data/household_power_consumption.txt")) {
        download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data/exdata-data-household_power_consumption.zip", mode="wb")
        unzip("./data/exdata-data-household_power_consumption.zip", exdir = "./data", overwrite = TRUE)
}

# Load electric power consumption data set
power <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?")

# Convert Date variables to Date class
power$Date <- as.Date(power$Date,"%d/%m/%Y")

# Subset the dataset to date range of 2007-02-01 through 2007-02-02
power <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

# Create PNG file
png("plot1.png", width=480, height=480)

# Plot 1 - histogram of global active power
hist(power$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

# Close PNG device
dev.off()

