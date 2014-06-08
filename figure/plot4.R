#the data is assumed to be located within the working directory

#loading in the data
data <- read.table("household_power_consumption.txt",
                   sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings="?",
                   colClasses=c("character","character", rep("numeric",7)))
#convert the time to time class
data$Time <- strptime(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S")
#convert the data to a data class
data$Date <- as.Date(data$Date,format="%d/%m/%Y")



#selecting the data we need
plotdata <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

#making a histogram
png("plot4.png")
par(mfrow=c(2,2))
#the plot as saved in the repository shows the German shorts for Thursday, Friday
#and Saturday because they are part of my locale and I did not manage to change it yet
plot(plotdata$Time, plotdata$Global_active_power, type="l",lty=1, ylab="Global active power",xlab="")
#plot2
plot(plotdata$Time, plotdata$Voltage, type="l", ylab="Voltage", xlab="datetime")

#plot 3
plot(plotdata$Time, plotdata$Sub_metering_1, type="l",lty=1, ylab="Energy sub metering",xlab="")
points(plotdata$Time, plotdata$Sub_metering_2, type="l", col="red")
points(plotdata$Time, plotdata$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"), bty="n")
#plot4
plot(plotdata$Time, plotdata$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab="datetime")
dev.off()

