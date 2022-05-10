##Extract file data
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
## limit the data from 1/2/2007 and 2/2/2007 for plotting
df <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])

## transform to date format
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df<-cbind(df, "DateTime" = as.POSIXct(paste(df$Date, df$Time)))

# create histogram
png("plot1.png", width = 480, height = 480)
hist(as.numeric(df$Global_active_power), col="Red", 
     main="Global Active Power", xlab="Global Active power (kilowatts)", 
     ylab="Frequency")
dev.off()