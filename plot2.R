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

png("plot2.png", width = 480, height = 480)

plot(sub$DateTime, sub$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="")


dev.off()