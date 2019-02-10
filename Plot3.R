setwd("~/Rcoding/plottingclass/Ass1")

All_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

All_data$Date<-as.Date(All_data$Date,"%d/%m/%Y")
The_data <- All_data[All_data$Date>="2007-02-01" & All_data$Date<="2007-02-02",]

datetime <- paste(as.Date(The_data$Date), The_data$Time)
The_data$Datetime <- as.POSIXct(datetime)

with(The_data, {
  plot(Datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  points(Datetime, Sub_metering_1,type="l")
  points(Datetime, Sub_metering_2,col="red",type="l")
  points(Datetime, Sub_metering_3,col="blue",type="l")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, filename = "plot3.png")
dev.off()