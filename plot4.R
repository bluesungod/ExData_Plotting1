# This is for the first course project for Exploratory Data Analysis.
# Generating Plot 4

# We assume the dataset has been unzipped as a .txt file.

# First let's read in the relevant dates of the dataset only.

library(sqldf)
# Make sure the path is accurate, based on where the dataset is.
path <- "C:/Users/bluesungod/Desktop/data science certification/exploratory data analysis/household_power_consumption.txt"
df <- read.csv.sql(path, sep=";", 
    sql = 'SELECT * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

# Convert dates, as suggested by prompt.
x <- paste(df$Date, df$Time)
df$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

# The fourth plot is actually four plots in a 2x2 design... let's do it.
par(mfrow=c(2,2))
plot(df$DateTime, df$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")
plot(df$DateTime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(df$DateTime, df$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")
plot(df$DateTime, df$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")

# Save a copy of the chart to a PNG file.
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
