if(!file.exists('data.zip')){
  url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url,destfile = "data.zip")
}
unzip("data.zip")
library(ggplot2)
newdata01 <- subset(read.table("household_power_consumption.txt", header = TRUE, sep = ";"), Date=="1/2/2007")
newdata02 <- subset(read.table("household_power_consumption.txt", header = TRUE, sep = ";"), Date=="2/2/2007")
total <- rbind(newdata01, newdata02)
total$DateTime<-paste(total$Date, total$Time)
data$DateTime<-strptime(data$DateTime,"%d/%m/%Y %H:%M:%S")
plot(total$DateTime, as.numeric(as.character(total$Sub_metering_1)),type="l", 
     ylab ="Energy sub metering", xlab="")
lines(total$DateTime, as.numeric(as.character(total$Sub_metering_2)),type="l", col='red')
lines(total$DateTime, total$Sub_metering_3,type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
ggsave("plot3.png", width=127, height=127, units="mm")
