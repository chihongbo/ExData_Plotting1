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

## Convert the date into the standard format
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
## Prepare the "Y" data
globalActivePower <- as.numeric(subData$Global_active_power)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

## png file setting
png("plot3.png", width=480, height=480)

## Plot Figures
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", col="black",xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
## Close the Device
dev.off()
