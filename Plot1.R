## Download and unzip the file
ZipFile="exdata-data-household_power_consumption.zip"
URL="http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists(ZipFile)) {
  download.file(URL,ZipFile)
} else{
  PowerdataFile <- unzip(ZipFile)
}
## Read the file to the R system
PowerData <- read.table(PowerdataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")
## Filter the data set based on the date
subData <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007") ,]
## Prepare the "Y" data
globalActivePower <- subData$Global_active_power

## png file setting
png("plot1.png", width=480, height=480)
## Plot Figures
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Close the Device
dev.off()