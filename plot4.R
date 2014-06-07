# download data from local text file
ElecPower <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# subset data for selected dates
ElecPower <- subset(ElecPower, ElecPower$Date == "1/2/2007" | ElecPower$Date == "2/2/2007")

# open png file device, name file, initialize size
png(file="plot4.png",width=480,height=480)

# Set row parameter for 2 X 2 graph
par(mfrow= c(2,2))

# Draw first plot upper left (Global active power)
plot(ElecPower$Global_active_power, type = 'l',xaxt = 'n' ,
     xlab = "", ylab="Global Active Power")
axis(1,at = c(0,1440,2880), labels = c('Thu', 'Fri', 'Sat'))

# Draw second plot upper right (Voltage)
plot(ElecPower$Voltage, type = 'l',xaxt = 'n' ,xlab = "datetime",
     ylab="Voltage")
axis(1,at = c(0,1440,2880), labels = c('Thu', 'Fri', 'Sat'))

# Draw third plot lower left (submetering)
plot(ElecPower$Sub_metering_1,type="l", xaxt= "n", 
     xlab = "", ylab="Energy sub metering")
axis(1,c(0,1440,2880), labels = c('Thu', 'Fri', 'Sat'))
lines(ElecPower$Sub_metering_3, col = 'Blue')
lines(ElecPower$Sub_metering_2, col = 'Red')
legend("topright",lty = 1, col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n")

# Draw fourth plot lower right (global reactive power)
plot(ElecPower$Global_reactive_power, type = 'l',xaxt = 'n' ,
     xlab = "datetime",ylab="Global_Reactive_Power")
axis(1,at = c(0,1440,2880), labels = c('Thu', 'Fri', 'Sat'))

# turn off png file device
dev.off()