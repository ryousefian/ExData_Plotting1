setwd("~/Rcoding/plottingclass/Ass1")

All_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

All_data$Date<-as.Date(All_data$Date,"%d/%m/%Y")
The_data <- All_data[All_data$Date>="2007-02-01" & All_data$Date<="2007-02-02",]

hist(The_data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="Red")

dev.copy(png, filename = "plot1.png")
dev.off()