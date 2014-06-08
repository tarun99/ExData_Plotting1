
# Read data
filename<-"household_power_consumption.txt"
df <- read.table(filename,
                 header=TRUE,
                 sep=";",
                 colClasses=c("character", "character", rep("numeric",7)),
                 na="?")
#Convert to time and date datatypes

png("plot3.png", width=400, height=400)

df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# subset two days
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data<-df[df$Date %in% dates,]

par(mfrow=c(2,2))
# 1
plot(data$Time, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")
# 2
plot(data$Time, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")
# 3
plot(data$Time, data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       box.lwd=0)
# 4
plot(data$Time, data$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(data$Time, data$Global_reactive_power)

dev.off()


