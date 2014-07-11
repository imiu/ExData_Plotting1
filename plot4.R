# PLOT 4
# =========

#download data
setwd("~/Desktop/Coursera/Data Scientist Certification Classes/4.Exploratory Data Analysis/EDA/Project1/")
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, "exdata-data-household_power_consumption.zip", method = "curl")

#unzip and load data into R
library("utils")
unzip("exdata-data-household_power_consumption.zip", list = TRUE, overwrite=TRUE)
pr1_data <- read.csv("household_power_consumption.txt", header = TRUE, colClasses = "character", sep = ';')
head(pr1_data)

#select data
pr1_data <- pr1_data[which(pr1_data[,1]=="1/2/2007" | pr1_data[,1] == "2/2/2007"),]

#transform data/time into Date format
Date_Time <- strptime(paste(pr1_data$Date, pr1_data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
pr1_data <- cbind(Date_Time, pr1_data[,-c(1:2)])

#plot the data
graphics.off() 
dev.new()
png("plot4.png", res = 55,  width = 680, height = 480, units = "px", pointsize = 12, bg = "white")
#dev.set(which = 2)
par(mfrow = c(2,2))
#par(mfcol = c(2, 2), mar = c(4, 4, 4, 2), oma = c(1, 1, 0, 0))
plot(pr1_data$Date_Time,  as.numeric(pr1_data$Global_active_power), 
     type = "l",
     ylab = "Global Active Power",
     xlab = ''
)

plot(pr1_data$Date_Time,  as.numeric(pr1_data$Voltage),
     type = "l",
     ylab = "Voltage",
     xlab = 'datetime'
)


plot(pr1_data$Date_Time,  as.numeric(pr1_data$Sub_metering_1),
     type = "l",
     ylab = "Energy sub metering",
     xlab = ''
)

#add new series
lines(pr1_data$Date_Time, as.numeric(pr1_data$Sub_metering_2), type = "l", col = "red")
lines(pr1_data$Date_Time, as.numeric(pr1_data$Sub_metering_3), type = "l", col = "blue")

# add legend
legend(x = "topright",
       bty = "n",
       y.intersp = 0.7,
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1, 1, 1), 
       lwd=c(2.5, 2.5, 2.5),
       col=c("black", "red", "blue")
)

plot(pr1_data$Date_Time,  as.numeric(pr1_data$Global_reactive_power),
     type = "l",
     ylab = "Global_reactive_power",
     xlab = 'datetime'
)


#dev.copy(which = 4)
dev.off()
dev.cur()

