require(sqldf)
data <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep=";",
                     sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

datetime <- paste(data$Date,data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

data <- cbind(datetime,data[,3:9])

png("plot2.png", width=480, height=480)
plot(data$Global_active_power~data$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()