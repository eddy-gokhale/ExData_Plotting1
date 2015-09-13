# Define Filename.
file_name <- "./household_power_consumption.txt"
#Load file and take a sebset of data.
dataset <- read.table(file_name, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)
subset <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]
# Get timestamps
timestamp <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Convert to values to Numeric for calculation purpose.
global_active_power <- as.numeric(subset$Global_active_power)
sub_Metering_1 <- as.numeric(subset$Sub_metering_1)
sub_Metering_2 <- as.numeric(subset$Sub_metering_2)
sub_Metering_3 <- as.numeric(subset$Sub_metering_3)
global_reactive_power <- as.numeric(subset$Global_reactive_power)
vltg <- as.numeric(subset$Voltage)
# Define output file.
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
#Plot graphs
plot(timestamp, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(timestamp, vltg, type="l", xlab="datetime", ylab="Voltage")
plot(timestamp, sub_Metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(timestamp, sub_Metering_2, type="l", col="red")
lines(timestamp, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(timestamp, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#Close Device.
dev.off()