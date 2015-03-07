##Set the working directory and Load the data
file1 <- file("household_power_consumption.txt")
##load partial data for just two dates
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file1), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
##Set the Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# set the boundaries and margines
par(mfrow = c(2,2), mar = c(1,1,1,1), oma = c(0,0,0,0))

Plot the graph within the boundaries
with(data, {
     plot(Global_active_power ~ Datetime, type = "l", 
     ylab = "Global Active Power", xlab = "")
     plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
     plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
          xlab = "")
     lines(Sub_metering_2 ~ Datetime, col = 'Red')
     lines(Sub_metering_3 ~ Datetime, col = 'Blue')
     legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
             bty = "n",
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(Global_reactive_power ~ Datetime, type = "l", 
          ylab = "Global_rective_power", xlab = "datetime")
})