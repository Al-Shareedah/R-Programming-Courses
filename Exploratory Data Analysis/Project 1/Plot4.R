## Similar to plot3.R the first steps are repeated.
##Extract file data
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
## limit the data from 1/2/2007 and 2/2/2007 for plotting
df <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])

## transform to date format
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df<-cbind(df, "DateTime" = as.POSIXct(paste(df$Date, df$Time)))

# create the plot with multiple subplots
png("plot4.png", width = 480, height = 480)

with(df, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})

par(mfrow=c(2,2))
plot(df$Global_active_power ~ df$DateTime, type="l")
plot(df$Voltage ~ df$DateTime, type="l")

with(df, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(df$Sub_metering_2 ~ df$DateTime, col = 'Red')
lines(df$Sub_metering_3 ~ df$DateTime, col = 'Blue')

plot(df$Global_reactive_power ~ df$DateTime, type="l")
dev.off()