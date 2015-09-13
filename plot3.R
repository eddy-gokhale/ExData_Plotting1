# Define Filename.
file_name <- "./household_power_consumption.txt"
#Load file and take a sebset of data.
dataset <- read.table(file_name, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)
subset <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]
# Get timestamps
timestamp <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Convert to values to Numeric for calculation purpose.
global_active_power <- as.numeric(subset$Global_active_power)
sub_Metering_1 <- as.numeric(subSetData$Sub_metering_1)
sub_Metering_2 <- as.numeric(subSetData$Sub_metering_2)
sub_Metering_3 <- as.numeric(subSetData$Sub_metering_3)

# Define output file.
png("plot3.png", width=480, height=480)
#Plot the graph
plot(timestamp, sub_Metering_1, type="l", ylab="Energy Sub metering", xlab="")
#Define Plot characteristics
lines(timestamp, sub_Metering_2, type="l", col="red")
lines(timestamp, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#Close Device
dev.off()