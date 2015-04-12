data <- read.csv("household_power_consumption.txt", sep = ";", na.strings ="?")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

beginDate <- as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S")
endDate <- as.POSIXct("2007-02-02 23:59:59", format="%Y-%m-%d %H:%M:%S")

sdata <- subset(data, (DateTime >= beginDate & DateTime <= endDate) )

png("plot1.png", width = 480, height = 480, units = "px", bg = "white")

hist(sdata$Global_active_power, col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off() ## Close the PDF file device