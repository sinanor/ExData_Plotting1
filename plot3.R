data <- read.csv("household_power_consumption.txt", sep = ";", na.strings ="?")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

beginDate <- as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S")
endDate <- as.POSIXct("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S")

sdata <- subset(data, (DateTime >= beginDate & DateTime <= endDate) )

png("plot3.png", width = 480, height = 480, units = "px", bg = "white")

plot(sdata$DateTime,sdata$Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
lines(sdata$DateTime,sdata$Sub_metering_2, col="red")
lines(sdata$DateTime,sdata$Sub_metering_3, col="blue")

legend( x="topright", 
        legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
        col=c("black", "red","blue"), lwd=1 
)

dev.off() ## Close the PDF file device