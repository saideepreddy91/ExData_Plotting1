rm(list=ls(all=TRUE))
setwd('C:/Users/saideep.reddy/Downloads/exdata_datahousehold_power_consumption')

power_consum <- read.table("household_power_consumption.txt", header = T,sep=";")

power_consum$Date=as.Date(power_consum$Date,format="%d/%m/%Y")
#data=power_consum[Date<="2007-02-02"& Date>=" 2007-02-01"]

power_final=subset(power_consum,Date<="2007-02-02"& Date>=" 2007-02-01")
library(data.table)
power_final=data.table(power_final)

#power_final$Global_active_power=as.numeric(levels(power_final$Global_active_power))[power_final$Global_active_power]

power_final$Sub_metering_1=as.numeric(levels(power_final$Sub_metering_1))[power_final$Sub_metering_1]

power_final$Sub_metering_2=as.numeric(levels(power_final$Sub_metering_2))[power_final$Sub_metering_2]

#power_final$Sub_metering_3=as.numeric(levels(power_final$Sub_metering_3))[power_final$Sub_metering_3]

#power_final$dayofweek=as.factor(weekdays(power_final$Date))

png("plot3.PNG",width=480,height=480,units="px")
plot(power_final$Sub_metering_1,type="l",xaxt="n",ylab="Enery sub metering")
lines(power_final$Sub_metering_2,col="red",xaxt="n")
lines(power_final$Sub_metering_3,xaxt="n",col="blue")
axis(1, at = c(1,1440,2880), las=2,labels = c("Thu","Fri","Sat"),tick=T)

legend("topright", # places a legend at the appropriate place 
c("Sub_metering_1","Sub_metering_3","Sub_metering_3"), # puts text in the legend
cex=0.65,
lty=c(1,1,1), # gives the legend appropriate symbols (lines)
lwd=c(2.5,2.5,2.5),col=c("grey","blue","red")) # gives the legend lines the correct color and width

dev.off()
