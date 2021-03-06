require(sqldf)
data <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep=";",
                     sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

datetime <- paste(data$Date,data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

data <- cbind(datetime,data[,3:9])

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data$Global_active_power~data$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(data$Voltage~data$datetime, type="l", ylab="Voltage", xlab="datetime")
plot(data$Sub_metering_1~data$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Sub_metering_2~data$datetime, col="red")
lines(data$Sub_metering_3~data$datetime, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"), bty="n")
plot(data$Global_reactive_power~data$datetime, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()