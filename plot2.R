epc <- read.table("household_power_consumption.txt" , sep= ";" , header = T , na.strings = "?" , as.is = 1:2)
epc$Date <- as.Date(epc$Date , "%d/%m/%Y")
set <- subset(epc,Date == "2007-02-01" | Date == "2007-02-02")
png('plot2.png' , width = 480 , height = 480)
plot(set$Global_active_power , type = "l" , xaxt ='n', xlab = "" , ylab = "Global Active Power")
ticks <- c(0,nrow(set)/2 , nrow(set))
axis(1,at = ticks,labels = c("Thu","Fri","Sat"))
dev.off()