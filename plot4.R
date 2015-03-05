data<-read.csv("household_power_consumption.txt", header=TRUE, na.strings="?",stringsAsFactors=F,sep=";" )
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

newdata<-subset(data, data$Date>="2007-02-01" & data$Date<="2007-02-02")
datime<-paste(as.Date(newdata$Date), newdata$Time)
datime<-as.POSIXct(datime)
png(filename="plot4.png",width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(newdata$Global_active_power~datime, type="l",ylab="Global Active Power (killowatts)",xlab="")
plot(newdata$Voltage~datime, type="l", ylab="Voltage",xlab="Datetime")
plot(newdata$Sub_metering_1~datime, type="l",ylab="Energy Sub metering",xlab="")
  lines(newdata$Sub_metering_2~datime, col="Red", type="l")
  lines(newdata$Sub_metering_3~datime, col="Blue", type="l")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("Black","Red","Blue"), lty=1, lwd=2, bty="n")
plot(newdata$Global_reactive_power~datime, type="l", ylab="Global reactive power" ,xlab="Datetime")

dev.off()