##collect data
data <- read.table("household_power_consumption.txt",header=T,sep=";",quote="")

##change date format from local to english one
Sys.setlocale("LC_TIME", "English_United Kingdom")

## create a subsetting data for exploratory research and clean data
data$Date2 <-as.Date( as.character(data$Date), "%d/%m/%Y")
subdata <- subset(data, Date2 >= as.Date("2007-02-01") & Date2 < as.Date("2007-02-03") )
subdata$GAP <- as.numeric(as.character(subdata$Global_active_power))
subdata$DateTime <- paste(subdata$Date2,subdata$Time,sep=" ")
subdata$DateTime2 <- as.POSIXct(subdata$DateTime)

##plot Global Active Power by date in a png file
png("plot2.png")
plot(subdata$DateTime2,subdata$GAP,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(subdata$DateTime2,subdata$GAP)
dev.off()