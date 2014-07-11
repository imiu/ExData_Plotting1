# PLOT 1
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
head(pr1_data)
tail(pr1_data)

#set date/time as Date 
Date_Time <- strptime(paste(pr1_data$Date, pr1_data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
pr1_data <- cbind(Date_Time, pr1_data[,-c(1:2)])
head(pr1_data)
tail(pr1_data)

# plot data
png("plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
dev.set(which = 2)
hist(as.numeric(pr1_data$Global_active_power), 
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     breaks = seq(0, 100, by = 0.5), 
     xlim = c(0, 7),
     xaxp = c(0, 6, 3), 
     ylim = c(0, 1200)
)
dev.copy(which = 4)
dev.off()
dev.cur()

