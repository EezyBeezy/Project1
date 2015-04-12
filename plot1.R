
## Full dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting
data1 <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data1$Global_active_power, main="Global Active Power", 
     xlab= "Global_active_power)", ylab="Frequency", col="Red")

## Copy
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

