colClassesInFile = c('character', 'character', 'numeric', 'numeric', 'numeric',
		     'numeric', 'numeric', 'numeric', 'numeric')
d <- read.table('household_power_consumption.txt', sep=';', header=T,
                   colClasses = colClassesInFile, na.strings='?')
d$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")
d <- subset(d, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

Sys.setlocale("LC_TIME", "en_GB.UTF-8")
png("plot2.png", height=480, width=480)
plot(d$DateTime, d$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = '')
dev.off()

