##Plot4.png

#Get Data
cdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?"  )

#get data subset for 1/2/2007 & 2/2/2007
sub_cdata<-subset(cdata, cdata$Date=="1/2/2007")
sub_cdata<-rbind(sub_cdata,subset(cdata, cdata$Date=="2/2/2007"))

#create datetime variable
sub_cdata$datetime<-paste(sub_cdata$Date,sub_cdata$Time)
sub_cdata$datetime<-as.POSIXct(sub_cdata$datetime, format= "%d/%m/%Y %H:%M:%S")

#open png graphics device
png(filename="plot4.png", units="px", width=480, height=480)
par(mfrow = c(2, 2))
with(sub_cdata, {
  plot(Global_active_power~datetime, type="o", pch="", lwd="2", ylab="Global Active Power",xlab="")
  plot(Voltage~datetime, type="o", pch="", lwd="1", ylab="Voltage",xlab="datetime")
  plot(Sub_metering_1~datetime, type="o", pch="", lwd="1", ylab="Energy sub metering",xlab="",col="black")
  lines(Sub_metering_2~datetime, type="o", pch="", lwd="1",col="red")
  lines(Sub_metering_3~datetime, type="o", pch="", lwd="1",col="blue")
  legend("topright", lty=c(1,1,1), col = c("black", "red","blue"), legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
  plot(Global_reactive_power~datetime, type="o", pch="", lwd="1", ylab="Global_Reactive_Power",xlab="datetime"
 ) })
dev.off()