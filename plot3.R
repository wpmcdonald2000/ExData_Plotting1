# download data from local text file
ElecPower <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# subset data for selected dates
ElecPower <- subset(ElecPower, ElecPower$Date == "1/2/2007" | ElecPower$Date == "2/2/2007")

# open png file device, name file, initialize size
png(file="plot3.png",width=480,height=480)

# Draw line plot with 3 data sets Sub_metering_1, 2, and 3
# Add legend, modify axis
plot(ElecPower$Sub_metering_1,type="l", xaxt= "n", 
     ylab="Energy sub metering")
axis(1,c(0,1440,2880), labels = c('Thu', 'Fri', 'Sat'))
lines(ElecPower$Sub_metering_3, col = 'Blue')
lines(ElecPower$Sub_metering_2, col = 'Red')
legend("topright",lty = 1, col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# turn off png file device
dev.off()