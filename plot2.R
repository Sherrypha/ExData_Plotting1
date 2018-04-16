##Plot2.png

#Get Data
cdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?"  )

#get data subset for 1/2/2007 & 2/2/2007
sub_cdata<-subset(cdata, cdata$Date=="1/2/2007")
sub_cdata<-rbind(sub_cdata,subset(cdata, cdata$Date=="2/2/2007"))

#create datetime variable
sub_cdata$datetime<-paste(sub_cdata$Date,sub_cdata$Time)
sub_cdata$datetime<-as.POSIXct(sub_cdata$datetime, format= "%d/%m/%Y %H:%M:%S")

#open png graphics device
png(filename="plot2.png", units="px", width=480, height=480)
plot(sub_cdata$Global_active_power~sub_cdata$datetime, type="o", pch="", lwd="1", ylab="Global Active Power (Kilowatts)",xlab="")
dev.off()