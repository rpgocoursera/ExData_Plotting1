#####################################################################################################################################
## Name       : Plot 3
## Description: This R code does the following:
##              1. Read file household_power_consumption.txt (around 20mb) as table
##              2. Add a new DateTime from the column Date and TIme
##              3. Set the Date column as Date for subsetting
##              4. Subset the data that falls on 2007-02-01 or 2007-02-02
##              5. Output into a png with width and length of 480
##              6. Plot the subset data with DateTime against Sub_metering_1(black), Sub_metering_2 (red), Sub_metering_3 (blue)
##              7. Add legend to topright corner.
## Note       : Data file is located within current working directory
#####################################################################################################################################

dataHPC <- read.table( "household_power_consumption.txt", col.names = c( "Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), stringsAsFactors=FALSE, sep = ";", header = TRUE )

dataHPC$Datetime <- strptime( paste( dataHPC$Date, dataHPC$Time ), "%d/%m/%Y %H:%M:%S" )

dataHPC$Date <- as.Date( dataHPC$Date,"%d/%m/%Y" )

dataHPCSubset <- dataHPC[ dataHPC$Date >= "2007-02-01" & dataHPC$Date<="2007-02-02", ]

png( "plot3.png", width=480, height=480 )

plot( dataHPCSubset$Datetime, dataHPCSubset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black" )

points( dataHPCSubset$Datetime, dataHPCSubset$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red" )

points( dataHPCSubset$Datetime, dataHPCSubset$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue" )

legend( "topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )

dev.off()
