# This is for the first course project for Exploratory Data Analysis.
# Generating Plot 2

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

# The second plot requires the plot function. Here we go.
plot(df$DateTime, df$Global_active_power, type = "l", xlab = "", 
    ylab = "Global Active Power (kilowatts)")

# Save a copy of the chart to a PNG file.
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
