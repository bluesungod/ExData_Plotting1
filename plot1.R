# This is for the first course project for Exploratory Data Analysis.
# Generating Plot 1

# We assume the dataset has been unzipped as a .txt file.

# First let's read in the relevant dates of the dataset only.

library(sqldf)
# Make sure the path is accurate, based on where the dataset is.
path <- "C:/Users/bluesungod/Desktop/data science certification/exploratory data analysis/household_power_consumption.txt"
df <- read.csv.sql(path, sep=";", 
    sql = 'SELECT * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

# The first plot is a simple histogram. Let's do this.
hist(df$Global_active_power, main="Global Active Power", 
    xlab="Global Active Power (kilowatts)", ylab = "Frequency", col="Red")

# Save a copy of the histogram to a PNG file.
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()