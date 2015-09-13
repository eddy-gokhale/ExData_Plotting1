# Define Filename.
file_name <- "./household_power_consumption.txt"
#Load file and take a sebset of data.
dataset <- read.table(file_name, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)
subset <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]
# Get timestamps
timestamp <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Convert to Numeric for calculation purpose.
global_active_power <- as.numeric(subset$Global_active_power)
# Define output file.
png("plot2.png", width=480, height=480)
#Plot dataset
plot(timestamp, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Close Device
dev.off()