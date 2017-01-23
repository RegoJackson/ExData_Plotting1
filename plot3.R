library(ggplot2)
#reading data into R:

pow<-read.table('E:/directorycoursera/household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days:

sub<- subset(pow, (pow$Date == "1/2/2007" | pow$Date== "2/2/2007"))

# Changing the class of Date variable from character to Date: 

sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")

# Combining the Date and Time variable and creating a new column in dataset named "DateTime":

sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

# Creating the plot2:

png("plot3.png", width = 480, height = 480)

plot(sub$DateTime, sub$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")

lines(sub$DateTime, sub$Sub_metering_2, type="l", col="red")

lines(sub$DateTime, sub$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()