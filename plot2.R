# download data from local text file
ElecPower <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# subset data for selected dates
ElecPower <- subset(ElecPower, ElecPower$Date == "1/2/2007" | ElecPower$Date == "2/2/2007")

# open png file device, name file, initialize size
png(file="plot2.png",width=480,height=480)

# create line plot of global active power
plot(ElecPower$Global_active_power, type = 'l',xaxt = 'n' ,ylab="Global Active Power (kilowatts)")

# add custom axis
axis(1,at = c(0,1440,2880), labels = c('Thu', 'Fri', 'Sat'))

# turn off png file device
dev.off()
