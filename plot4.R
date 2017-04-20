#step1 download zip file and unzip it. 

fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile="~./Rdatafile/power.zip")
file<-unzip("~./Rdatafile/power.zip")


#step2 import the data

data<-read.table("~./Rdatafile/household_power_consumption.txt",sep=";",skip=grep("1/2/2007",readLines("~./Rdatafile/household_power_consumption.txt")),nrows=60*24*2)
colnames(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
head(data)
tail(data)

#step3 plot the graph
par(mfrow=c(2,2))
#plot1
with(data, plot(strptime(paste(Date,Time,sep=""),"%d/%m/%Y %H:%M:%S"), Global_active_power,type="l", xlab="",ylab="Global Active Power"))
#plot2
with(data, plot(strptime(paste(Date,Time,sep=""),"%d/%m/%Y %H:%M:%S"), Voltage,type="l", xlab="datetime",ylab="Voltage"))
#plot3
with(data, plot(strptime(paste(Date,Time,sep=""),"%d/%m/%Y %H:%M:%S"), Sub_metering_1,type="l", xlab="",ylab="Energy sub metering"))
with(data,lines(strptime(paste(Date,Time,sep=""),"%d/%m/%Y %H:%M:%S"), Sub_metering_2,col="red"))
with(data,lines(strptime(paste(Date,Time,sep=""),"%d/%m/%Y %H:%M:%S"), Sub_metering_3,col="blue"))
legend("topright",lty=c(1,1,1), col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#plot4
with(data, plot(strptime(paste(Date,Time,sep=""),"%d/%m/%Y %H:%M:%S"), Global_reactive_power,type="h", xlab="datetime"))

#step4 save the image
dev.copy(png,file="plot4.png")
dev.off()