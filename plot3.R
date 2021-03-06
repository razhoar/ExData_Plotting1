colClassesInFile = c('character', 'character', 'numeric', 'numeric', 'numeric',
		     'numeric', 'numeric', 'numeric', 'numeric')
d <- read.table('household_power_consumption.txt', sep=';', header=T,
                   colClasses = colClassesInFile, na.strings='?')
d$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
d <- subset(d, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

Sys.setlocale("LC_TIME", "en_GB.UTF-8")
png("plot3.png", height=480, width=480)
plot(d$DateTime, d$Sub_metering_1, type="l", ylab = 'Energy sub metering', xlab='')
lines(d$DateTime, d$Sub_metering_2, col='red')
lines(d$DateTime, d$Sub_metering_3, col='blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))
dev.off()

