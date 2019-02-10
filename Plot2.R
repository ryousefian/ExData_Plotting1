setwd("~/Rcoding/plottingclass/Ass1")

All_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

All_data$Date<-as.Date(All_data$Date,"%d/%m/%Y")
The_data <- All_data[All_data$Date>="2007-02-01" & All_data$Date<="2007-02-02",]

datetime <- paste(as.Date(The_data$Date), The_data$Time)
The_data$Datetime <- as.POSIXct(datetime)

plot(The_data$Global_active_power ~ The_data$Datetime,
     type = "l",
     xlab = "",
     ylab="Global Active Power (kilowatts)")

dev.copy(png, filename = "plot2.png")
dev.off()