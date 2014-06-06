# download data from local text file
ElecPower <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# subset data for selected dates
ElecPower <- subset(ElecPower, ElecPower$Date == "1/2/2007" | ElecPower$Date == "2/2/2007")

# open png file device, name file, initialize size
png(file="plot1.png",width=480,height=480)

# create histogram of global active power
# color bins as red, create x axis labels and title
hist(ElecPower$Global_active_power, col=c("red"), xlab="Global Active Power (kilowatts)", main="Global Active Power")

# turn off png file device
dev.off()
