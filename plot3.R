data<-read.csv("household_power_consumption.txt", header=TRUE, na.strings="?",stringsAsFactors=F,sep=";" )
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
newdata<-subset(data, data$Date>="2007-02-01" & data$Date<="2007-02-02")
datime<-paste(as.Date(newdata$Date), newdata$Time)
datime<-as.POSIXct(datime)
png(filename="plot3.png", width=480, height=480)
plot(newdata$Sub_metering_1~datime, type="l",ylab="Energy Sub metering",xlab="")
points(newdata$Sub_metering_2~datime, col="Red", type="l")
points(newdata$Sub_metering_3~datime, col="Blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("Black","Red","Blue"), lty=c(1,1,1))

dev.off()