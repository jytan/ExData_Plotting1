setwd("~/Desktop/test_repo/householddata")

data <- read.csv2("household_power_consumption.txt",stringsAsFactors=F)
data$DateTime <- as.POSIXct(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
data$DateTime <- as.POSIXlt(data$DateTime)
req_data <- subset(data,as.Date(data$DateTime)=="2007-02-01"|as.Date(data$DateTime)=="2007-02-02")
req_data[,3:9] <- apply(req_data[,3:9],2,as.numeric)

png("plot4.png")
par(mfcol=c(2,2))
plot(req_data$DateTime,req_data$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(req_data$DateTime,req_data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(req_data$DateTime,req_data$Sub_metering_2,col="red")
lines(req_data$DateTime,req_data$Sub_metering_3,col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

plot(req_data$DateTime,req_data$Voltage,xlab="datetime",ylab="Voltage",type="l")

plot(req_data$DateTime,req_data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
