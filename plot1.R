setwd("~/Desktop/test_repo/householddata")

data <- read.csv2("household_power_consumption.txt",stringsAsFactors=F)
data$DateTime <- as.POSIXct(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
data$DateTime <- as.POSIXlt(data$DateTime)
req_data <- subset(data,as.Date(data$DateTime)=="2007-02-01"|as.Date(data$DateTime)=="2007-02-02")
req_data$Global_active_power <- as.numeric(req_data$Global_active_power)

par(cex=0.8,bg="transparent")
png("plot1.png")
hist(req_data$Global_active_power,breaks=12,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
