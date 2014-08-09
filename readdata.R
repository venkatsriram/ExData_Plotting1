# The download function accepts the url to download the zip file from with a 
# default url, the name of the zipfile to be saved as and unzips the file

download <- function(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zipfile="powerconsumption.z") {
    
    # downloads the file at the specified url with quiet so the load progress
    # is suppressed
    download.file(url, destfile=zipfile, method="curl", quiet=TRUE)

    # Checks whether the download was successful and gets the name of the 
    # downloaded file and unzips the file
    if (file.exists(zipfile)) {
        datafile <- unzip(zipfile, list=TRUE)
        unzip(zipfile)
	datafile$Name
    }
}

# read_house_power_cosumption function calls the download function 
# to read the downloaded data file. It accepts the from and to date
# to read only selective data using the sqldf library.

read_house_power_consumption <- function(fromdt='1/2/2007', todt='2/2/2007') {

    # load the sqldf library
    library(sqldf)

    # Call the download function to download and unzip the file from URL
    datafile <- download()

    # Construct the sql statement to select only data for the from and to dates
    sqlstmt = "select * from file where Date = '"
    sqlstmt = paste(sqlstmt, fromdt, "' or Date = '", todt, "'", sep="")

    # Read the data from the data file using the sql for the input dates
    power <- read.csv.sql(datafile, sql=sqlstmt, sep=";", header=TRUE)

    # Add a column that combines the "Character" Date and Time column into a new
    # Datetime class column
    power <- cbind(strptime(paste(power$Date, power$Time), format="%d/%m/%Y %X"), power)

    # Name the new Date class column as "Datetime"
    colnames(power)[1] <- "Datetime"

    # Return the read data
    power
}
