#the data is assumed to be located within the working directory

#loading in the data
data <- read.table("household_power_consumption.txt",
                   sep=";", header=TRUE, stringsAsFactors=FALSE)
#convert the time to time class
data$Time <- strptime(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S")
#convert the data to a data class
data$Date <- as.Date(data$Date,format="%d/%m/%Y")



#selecting the data we need
plotdata <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

#making a histogram
png("plot1.png")

plotdata$Global_active_power <- as.numeric(plotdata$Global_active_power)
hist(plotdata$Global_active_power, col="red", xlab="Global active power (kilowatts)", main="Global Active power")
dev.off()

