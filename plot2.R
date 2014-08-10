# source("load_data.R")
# 
# plot2 <- function(data=NULL) {
#   if(is.null(data))
#     data <- load_data()
#   
#   png("plot2.png", width=400, height=400)
#   
#   plot(data$Time, data$Global_active_power,
#        type="l",
#        xlab="",
#        ylab="Global Active Power (kilowatts)")
#   
#   dev.off()
# }

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$test<-paste(data$Date, data$Time , sep=" ")
data$Adate<-strptime(data$test, "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
df<-data[data$Date=='2007-02-01' | data$Date=='2007-02-02',]

plot(df$Time, df$Global_active_power_kilo, ylab="Global Active Power (kilowatts)", xlab="", type="l")




## Load Data
D <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
D$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subset Data
data_sub <- subset(D, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(D)

## Date Conversion
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)

## Plot 2
png("plot2.png", width=480, height=480)
plot(data_sub$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
