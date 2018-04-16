##Plot1.png

#Get Data
cdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?"  )

#get data subset for 1/2/2007 & 2/2/2007
sub_cdata<-subset(cdata, cdata$Date=="1/2/2007")
sub_cdata<-rbind(sub_cdata,subset(cdata, cdata$Date=="2/2/2007"))

#open png graphics device
png(filename="plot1.png", units="px", width=480, height=480)
hist(sub_cdata$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (Kilowatts)")
dev.off()