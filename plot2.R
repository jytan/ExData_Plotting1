# Setting the data directory
setwd("~/Desktop/test_repo/householddata")

# Reading in the data
data <- read.csv2("household_power_consumption.txt",stringsAsFactors=F)
data$DateTime <- as.POSIXct(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
data$DateTime <- as.POSIXlt(data$DateTime)
req_data <- subset(data,as.Date(data$DateTime)=="2007-02-01"|as.Date(data$DateTime)=="2007-02-02")
req_data$Global_active_power <- as.numeric(req_data$Global_active_power)

# Plotting
par(cex=0.8,bg="transparent")
png("plot2.png")
plot(req_data$DateTime,req_data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
