require(sqldf)
data <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep=";",
                     sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

png("plot1.png", width=480, height=480)
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()