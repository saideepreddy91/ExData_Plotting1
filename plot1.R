rm(list=ls(all=TRUE))
setwd('C:/Users/saideep.reddy/Downloads/exdata_datahousehold_power_consumption')

power_consum <- read.table("household_power_consumption.txt", header = T,sep=";")

power_consum$Date=as.Date(power_consum$Date,format="%d/%m/%Y")
#data=power_consum[Date<="2007-02-02"& Date>=" 2007-02-01"]

power_final=subset(power_consum,Date<="2007-02-02"& Date>=" 2007-02-01")
library(data.table)
power_final=data.table(power_final)

power_final$Global_active_power=as.numeric(levels(power_final$Global_active_power))[power_final$Global_active_power]



png("plot1.PNG",width=480,height=480,units="px")
plot(hist(power_final$Global_active_power,breaks=20),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")
dev.off()
