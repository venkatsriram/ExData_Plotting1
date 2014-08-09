# plot1 accepts the source file which contains the functions to 
# download and read the power consumption data and also the name of the 
# PNG file to save the resulting plot graph. It plots a histogram for
# the Global Active Power variable in the dataset

plot1 <- function(srcfile="readdata.R", pngfilename="plot1.png") {

     # Source the R file which contains functions to download and read the data
     source(srcfile)

     # Call read_house_power_consumption() in the srcfile to download and read
     # data and save it in a data frame
     power <- read_house_power_consumption()

     # Set the PNG file and its width and height in pixels
     png(pngfilename, width=480, height=480, units="px")

     # Set the margin in inches for the base histogram
     par(mai=c(1,1,1,1))
    
     # Plot the histogram for Global Active Power variable in the data
     hist(power$"Global_active_power", col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

     # Turn off the device
     dev.off()
}
