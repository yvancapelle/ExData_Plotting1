##collect data
data <- read.table("household_power_consumption.txt",header=T,sep=";",quote="")

## create a subsetting data for exploratory research and clean data
data$Date2 <- as.Date( as.character(data$Date), "%d/%m/%Y")
subdata <- subset(data, Date2 >= as.Date("2007-02-01") & Date2 < as.Date("2007-02-03") )
subdata$GAP <- as.numeric(as.character(subdata$Global_active_power))

## plot a histogram "frequency of Global Active Power" in a png file
png("plot1.png")
hist(subdata$GAP, xlab="Global Active Power (kilowatts)", main="Global Active Power", col= "red")
dev.off()