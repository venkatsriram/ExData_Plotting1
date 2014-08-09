# Plot3 accepts the source file which contains the functions to
# download and read the power consumption data and also the name of the
# PNG file to save the resulting plot graph. It plots three data points 
# Sub metering 1, 2 and 3 against Datetime in the dataset

plot3 <- function(srcfile="readdata.R", pngfilename="plot3.png") {

     # Source the R file which contains functions to download and read the data
     source(srcfile)

     # Call read_house_power_consumption() in the srcfile to download and read
     # data and save it in a data frame
     power <- read_house_power_consumption()

     # Set the PNG file and its width and height in pixels
     png(pngfilename, width=480, height=480, units="px")

     # Set the margin in inches for the base plot
     par(mai=c(1,1,1,1))

     # Plot for the Sub metering 1 data points against Datetime
     plot(power$"Datetime", power$"Sub_metering_1", type='l', xlab="", ylab="Energy sub metering")

     # Annotate for the Sub metering 2 data points against Datetime
     points(power$"Datetime", power$"Sub_metering_2", type='l', col="red")

     # Annotate for the Sub metering 3 data points against Datetime
     points(power$"Datetime", power$"Sub_metering_3", type='l', col="blue")

     # Set the legends at the top right corner with using grep to get the
     # legend names
     legend("topright", lty = 1, col = c("black", "red", "blue"), legend = grep("Sub", names(y), value=TRUE))

     # Turn off the device
     dev.off()
}
