#####################################################################################################################################
## Name       : Plot 1
## Description: This R code does the following:
##              1. Read file household_power_consumption.txt (around 20mb) as table
##              2. Set the Date column as Date for subsetting
##              3. Subset the data that falls on 2007-02-01 or 2007-02-02
##              4. Use column Global_active_power for plotting
##              5. Output into a png with width and length of 480
##              6. Plot the subset data as a histogram. Label for main is set to "Global Active Power" and X is set to "Global Active
##                 Power (kilowatts) 
## Note       : Data file is located within current working directory
#####################################################################################################################################


dataHPC <- read.table( "household_power_consumption.txt", col.names = c( "Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), stringsAsFactors=FALSE, sep = ";", header = TRUE )

dataHPC$Date <- as.Date( dataHPC$Date,"%d/%m/%Y" )

dataHPCSubset <- dataHPC[ dataHPC$Date >= "2007-02-01" & dataHPC$Date<="2007-02-02", ]

plot1 <- as.numeric( dataHPCSubset$Global_active_power )

png( "plot1.png", width=480, height=480 )

hist( plot1, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )

dev.off()
