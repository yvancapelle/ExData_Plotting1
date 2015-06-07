##collect data
data <- read.table("household_power_consumption.txt",header=T,sep=";",quote="")

##change date format from local to english one
Sys.setlocale("LC_TIME", "English_United Kingdom")

## create a subsetting data for exploratory research and clean data
data$Date2 <-as.Date( as.character(data$Date), "%d/%m/%Y")
subdata <- subset(data, Date2 >= as.Date("2007-02-01") & Date2 < as.Date("2007-02-03") )
subdata$GAP <- as.numeric(as.character(subdata$Global_active_power))
subdata$Volt <- as.numeric(as.character(subdata$Voltage))
subdata$SM1 <- as.numeric(as.character(subdata$Sub_metering_1))
subdata$SM2 <- as.numeric(as.character(subdata$Sub_metering_2))
subdata$SM3 <- as.numeric(as.character(subdata$Sub_metering_3))
subdata$GRP <- as.numeric(as.character(subdata$Global_reactive_power))
subdata$DateTime <- paste(subdata$Date2,subdata$Time,sep=" ")
subdata$DateTime2 <- as.POSIXct(subdata$DateTime)

##patchwork of different type of plot by date in a png file
png("plot4.png")
par(mfrow=c(2,2))

plot(subdata$DateTime2,subdata$GAP,type="n",xlab="",ylab="Global Active Power")
lines(subdata$DateTime2,subdata$GAP)
        
plot(subdata$DateTime2,subdata$Volt,type="n",xlab="datetime",ylab="Voltage")
lines(subdata$DateTime2,subdata$Volt)
        
plot(subdata$DateTime2,subdata$SM1,type="n",xlab="",ylab="Energy sub metering")
lines(subdata$DateTime2,subdata$SM1)
lines(subdata$DateTime2,subdata$SM2,col="red")
lines(subdata$DateTime2,subdata$SM3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
        
plot(subdata$DateTime2,subdata$GRP,type="n",xlab="datetime",ylab="Globale_reactive_power")
lines(subdata$DateTime2,subdata$GRP)

dev.off()