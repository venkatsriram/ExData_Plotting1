# plot2 accepts the source file which contains the functions to
# download and read the power consumption data and also the name of the
# PNG file to save the resulting plot graph. It plots a line plot for
# the Global Active Power variable against the Datetime for the two dates
# in the dataset

plot2 <- function(srcfile="readdata.R", pngfilename="plot2.png") {

     # Source the R file which contains functions to download and read the data
     source(srcfile)

     # Call read_house_power_consumption() in the srcfile to download and read
     # data and save it in a data frame
     power <- read_house_power_consumption()

     # Set the PNG file and its width and height in pixels
     png(pngfilename, width=480, height=480, units="px")

     # Set the margin in inches for the base plot
     par(mai=c(1,1,1,1))

     # Base Plot the line for Global Active Power against the days in the data
     plot(power$"Datetime", power$"Global_active_power", type='l', xlab="", ylab="Global Active Power (kilowatts)")

     # Turn off the device
     dev.off()
}
