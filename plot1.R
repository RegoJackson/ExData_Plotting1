library(ggplot2)
#reading data into R:

pow<-read.table('E:/directorycoursera/household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days:

sub<- subset(pow, (pow$Date == "1/2/2007" | pow$Date== "2/2/2007"))

# Changing the class of Date variable from character to Date: 

sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")

# Creating the plot1:

png("plot1.png", width = 480, height = 480)

hist(sub$Global_active_power, type="l", main="Global Active Power",col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)")

dev.off()