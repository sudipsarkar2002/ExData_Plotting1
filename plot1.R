##Set the working directory and Load the data
file1 <- file("household_power_consumption.txt")
##load partial data for two dates 
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file1), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

## Plot the histogram.
hist(data$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
