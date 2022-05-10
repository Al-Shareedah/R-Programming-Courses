## Similar to plot2.R the first steps are repeated.
##Extract file data
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
## limit the data from 1/2/2007 and 2/2/2007 for plotting
df <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])

## transform to date format
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df<-cbind(df, "DateTime" = as.POSIXct(paste(df$Date, df$Time)))

# create the plot with multiple lines
png("plot3.png", width = 480, height = 480)

with(df, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})

lines(df$Sub_metering_2 ~ df$DateTime, col = 'Red')
lines(df$Sub_metering_3 ~ df$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()