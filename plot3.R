##collect data
data <- read.table("household_power_consumption.txt",header=T,sep=";",quote="")

##change date format from local to english one
Sys.setlocale("LC_TIME", "English_United Kingdom")

## create a subsetting data for exploratory research and clean data
data$Date2 <-as.Date( as.character(data$Date), "%d/%m/%Y")
subdata <- subset(data, Date2 >= as.Date("2007-02-01") & Date2 < as.Date("2007-02-03") )
subdata$SM1 <- as.numeric(as.character(subdata$Sub_metering_1))
subdata$SM2 <- as.numeric(as.character(subdata$Sub_metering_2))
subdata$SM3 <- as.numeric(as.character(subdata$Sub_metering_3))
subdata$DateTime <- paste(subdata$Date2,subdata$Time,sep=" ")
subdata$DateTime2 <- as.POSIXct(subdata$DateTime)

##plot different sub metering by date in a png file
png("plot3.png")
plot(subdata$DateTime2,subdata$SM1,type="n",xlab="",ylab="Energy sub metering")
lines(subdata$DateTime2,subdata$SM1)
lines(subdata$DateTime2,subdata$SM2,col="red")
lines(subdata$DateTime2,subdata$SM3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()