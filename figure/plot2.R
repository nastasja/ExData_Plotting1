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
png("plot2.png")
#the plot as saved in the repository shows the German shorts for Thursday, Friday
#and Saturday because they are part of my locale and I did not manage to change it yet
plotdata$Global_active_power <- as.numeric(plotdata$Global_active_power)
plot(plotdata$Time, plotdata$Global_active_power, type="l",lty=1, ylab="Global active power in kilowatts",xlab="")
dev.off()

