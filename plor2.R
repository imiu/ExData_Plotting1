# PLOT 2
# =========
#download data
setwd("~/Desktop/Coursera/Data Scientist Certification Classes/4.Exploratory Data Analysis/EDA/")
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
png("plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
dev.set(which = 2)
plot(pr1_data$Date_Time,  as.numeric(pr1_data$Global_active_power), 
         type = "l",
         ylab = "Global Active Power (kilowatts)",
         xlab = ''
         )
dev.copy(which = 4)
dev.off()
dev.cur()

