# Read in data and create subset of all power data
setwd("C:/Users/David/Dropbox/Coursera/Exploratory Data Analysis/Course Project 1/exdata_data_household_power_consumption")
power.all<- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
power<- subset(power.all, power.all$Date %in% c("1/2/2007","2/2/2007"))
rm(power.all)

# Format data and time columns
power$datetime<- strptime(paste(power$Date,power$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
power$Date<- as.Date(power$Date,format="%d/%m/%Y")

#Plot graph and output to PNG file
png(filename="plot4.png",width=480, height=480)
par(mfcol=c(2,2))
# Top left graph
plot(power$datetime,power$Global_active_power,type="o", pch=NA, xlab="",ylab="Global Active Power")
# Bottom left graph
plot(power$datetime,power$Sub_metering_1,type="o", pch=NA, xlab="",ylab="Energy sub metering")
points(power$datetime,power$Sub_metering_2,type="o", pch=NA, col="red")
points(power$datetime,power$Sub_metering_3,type="o", pch=NA, col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"),bty="n")
# Top right graph
plot(power$datetime, power$Voltage,type="o", pch=NA, xlab="datetime",ylab="Voltage")
# Bottom right graph
plot(power$datetime, power$Global_reactive_power,type="o", pch=NA, xlab="datetime",ylab="Global_reactive_power")
dev.off()
