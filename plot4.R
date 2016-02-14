#####################################################################################################################################
## Name       : Plot 4
## Description: This R code does the following:
##              1. Read file household_power_consumption.txt (around 20mb) as table
##              2. Add a new DateTime from the column Date and TIme
##              3. Set the Date column as Date for subsetting
##              4. Subset the data that falls on 2007-02-01 or 2007-02-02
##              5. Output into a png with width and length of 480
##              6. Set into 2 by 2 plot combination
##              6. Plot the subset data with DateTime against Sub_metering_1(black), Sub_metering_2 (red), Sub_metering_3 (blue)
##              7. Add legend to topright corner.
#####################################################################################################################################

dataHPC <- read.table( "household_power_consumption.txt", col.names = c( "Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), stringsAsFactors=FALSE, sep = ";", header = TRUE )

dataHPC$Datetime <- strptime( paste( dataHPC$Date, dataHPC$Time ), "%d/%m/%Y %H:%M:%S" )

dataHPC$Date <- as.Date( dataHPC$Date,"%d/%m/%Y" )

dataHPCSubset <- dataHPC[ dataHPC$Date >= "2007-02-01" & dataHPC$Date<="2007-02-02", ]

png( "plot4.png", width=480, height=480 )

par(mfcol = c(2, 2))

plot( dataHPCSubset$Datetime, dataHPCSubset$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "" )

plot( dataHPCSubset$Datetime, dataHPCSubset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black" )
points( dataHPCSubset$Datetime, dataHPCSubset$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red" )
points( dataHPCSubset$Datetime, dataHPCSubset$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3",  col = "blue")
legend( "topright", lty = 1, col =c( "black", "red", "blue" ), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )

plot( dataHPCSubset$Datetime, dataHPCSubset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime" )

plot( dataHPCSubset$Datetime, dataHPCSubset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.off()
