
## Load Data
dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

## Subset Data
data_sub <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

## Date Conversion
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

## Plot 2
png("plot2.png", width=480, height=480)
plot(data_sub$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
