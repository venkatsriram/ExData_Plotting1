# Plot4 accepts the source file which contains the functions to
# download and read the power consumption data and also the name of the
# PNG file to save the resulting plot graph. It plots 4 graphs in a 2 x 2
# fashion. 

plot4 <- function(srcfile="readdata.R", pngfilename="plot4.png") {

     # Source the R file which contains functions to download and read the data
     source(srcfile)

     # Call read_house_power_consumption() in the srcfile to download and read
     # data and save it in a data frame
     power <- read_house_power_consumption()

     # Set the PNG file and its width and height in pixels
     png(pngfilename, width=480, height=480, units="px")

     # Set the margin in inches, number of rows and columns as 2 x 2
     par(mfrow = c(2, 2), mai = c(1, 1, 0.1, 0.1))

     # Plot Global Active Power against Datetime in the data
     plot(power$"Datetime", power$"Global_active_power", type='l', xlab="", ylab="Global Active Power")

     # Plot Voltage against Datetime in the data
     plot(power$"Datetime", power$"Voltage", type='l', xlab="datetime", ylab="Voltage")

     # Plot for the Sub metering 1 data points against Datetime
     plot(power$"Datetime", power$"Sub_metering_1", type='l', xlab="", ylab="Energy sub metering")

     # Annotate for the Sub metering 2 data points against Datetime
     points(power$"Datetime", power$"Sub_metering_2", type='l', col="red")

     # Annotate for the Sub metering 3 data points against Datetime
     points(power$"Datetime", power$"Sub_metering_3", type='l', col="blue")

     # Set the legends at the top right corner with using grep to get the 
     # legend names
     legend("topright", lty = 1, col = c("black", "red", "blue"), legend = grep("Sub", names(y), value=TRUE))

     # Plot Global Rective Power against Datetime in the data
     plot(power$"Datetime", power$"Global_reactive_power", type='l', xlab="datetime", ylab="Global_reactive_power")

     # Turn off the devic
     dev.off()
}
