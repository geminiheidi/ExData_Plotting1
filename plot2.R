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
with(data, plot(strptime(paste(Date,Time,sep=""),"%d/%m/%Y %H:%M:%S"), Global_active_power,type="l", xlab="",ylab="Global Active Power(kilowatts)"))


#step4 save the image
dev.copy(png,file="plot2.png")