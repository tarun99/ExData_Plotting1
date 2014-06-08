
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

hist(data$Global_active_power,main="Global Active Power",
xlab="Global Active Power (Kilowatts)",col="RED")

