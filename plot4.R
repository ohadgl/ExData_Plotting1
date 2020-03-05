epc <- read.table("household_power_consumption.txt" , sep= ";" , header = T , na.strings = "?" , as.is = 1:2)
epc$Date <- as.Date(epc$Date , "%d/%m/%Y")
set <- subset(epc,Date == "2007-02-01" | Date == "2007-02-02")

png('plot4.png' , width = 480 , height = 480)
par(mfrow = c(2,2))

plot(set$Global_active_power , type = "l" , xaxt ='n', xlab = "" , ylab = "Global Active Power")
ticks <- c(0,nrow(set)/2 , nrow(set))
axis(1,at = ticks,labels = c("Thu","Fri","Sat"))

plot(set$Voltage , type = "l" , xlab = "datetime" , ylab = names(set)[5], xaxt ='n')
ticks <- c(0,nrow(set)/2 , nrow(set))
axis(1,at = ticks,labels = c("Thu","Fri","Sat"))

plot(set$Sub_metering_1 , type = "l" , xlab = "" , ylab = "Energy sub metering", xaxt ='n')
lines(set$Sub_metering_2 , col = "red")
lines(set$Sub_metering_3 , col = "blue")
ticks <- c(0,nrow(set)/2 , nrow(set))
axis(1,at = ticks,labels = c("Thu","Fri","Sat"))
legend("topright" , colnames(set)[7:9] , col = c("black","red","blue") , lty = 1 ,bty = "n")

plot(set$Global_reactive_power , type = "l" , xlab = "datetime" , ylab = names(set)[4], xaxt ='n')
ticks <- c(0,nrow(set)/2 , nrow(set))
axis(1,at = ticks,labels = c("Thu","Fri","Sat"))


dev.off()