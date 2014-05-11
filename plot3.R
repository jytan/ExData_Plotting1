# Setting the data directory
setwd("~/Desktop/test_repo/householddata")

# Reading in the data
data <- read.csv2("household_power_consumption.txt",stringsAsFactors=F)
data$DateTime <- as.POSIXct(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
data$DateTime <- as.POSIXlt(data$DateTime)
req_data <- subset(data,as.Date(data$DateTime)=="2007-02-01"|as.Date(data$DateTime)=="2007-02-02")
req_data[,3:9] <- apply(req_data[,3:9],2,as.numeric)

# Plotting
par(cex=0.8,bg="transparent")
png("plot3.png")
plot(req_data$DateTime,req_data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(req_data$DateTime,req_data$Sub_metering_2,col="red")
lines(req_data$DateTime,req_data$Sub_metering_3,col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
