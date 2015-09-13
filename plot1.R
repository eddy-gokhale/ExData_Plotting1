# Define Filename.
file_name <- "./data/household_power_consumption.txt"
#Load file and take a sebset of data.
dataset <- read.table(file_name, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)
subset <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]
#Convert to Numeric for calculation purpose.
globalActivePower <- as.numeric(subSetData$Global_active_power)
# Define output file.
png("plot1.png", width=480, height=480)
#Plot a histogram.
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#Close Device
dev.off()