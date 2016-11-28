
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
hist(as.numeric(as.character(total$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
ggsave("plot1.png", width=127, height=127, units="mm")