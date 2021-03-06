# Load Data

dataset<-read.table(file.choose(),sep=";", colClasses=c("character", "character", rep("numeric",7)),na="?",header=TRUE)
head(dataset)

# Date Conversion
dataset$Time <- strptime(paste(dataset$Date, dataset$Time), "%d/%m/%Y %H:%M:%S")
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

# Subset Data
dates <- as.Date(c("2007-01-02", "2007-02-02"), "%Y-%d-%m")
dataset <- subset(dataset, Date %in% dates)

# Plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(dataset$Global_active_power), main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency", col="red")
dev.off()
