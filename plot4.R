source("Data.R")

# Get data
file_name <- "household_power_consumption.txt" 
date_from <- "2007-02-01"
date_till <- "2007-02-03"
df <- Read_Data(file_name, date_from, date_till)

# Display plot on screen
par(mfrow=c(2,2))
cex <- 0.7
# weeks_nam <- names(table(df$Weekday))
# weeks_pos <- lapply(names(table(df$Weekday)), function(x){floor(median(which(df$Weekday == x)))})
daterange <- c(as.POSIXlt(min(df$Date_Time)),as.POSIXlt(max(df$Date_Time)))   #figure out the lowest and highest dates


# Display plot1
ylab <- "Global Active Power"
plot(x = df$Date_Time, y = df$Global_active_power, axes=F, type="l", xlab="", ylab=ylab, cex.lab=cex)
box(lwd=2, col="gray")
# axis(side=1, weeks_pos, weeks_nam, cex.axis=cex)
axis.POSIXct(1, at=seq(daterange[1], daterange[2], by="day"), format="%a") #label the x axis by weekday
axis(side=2, cex.axis=0.7)

# Display plot2
plot(x = df$Date_Time, y = df$Voltage, axes=F, type="l", xlab="datetime", ylab="Voltage", cex.lab=cex)
box(lwd=2, col="gray")
# axis(side=1, weeks_pos, weeks_nam, cex.axis=cex)
axis.POSIXct(1, at=seq(daterange[1], daterange[2], by="day"), format="%a") #label the x axis by weekday
axis(side=2, cex.axis=cex)

# Display plot3
col <- c("black", "red", "blue")
legend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
ylab <- "Energy sub metering"
plot(x = df$Date_Time, y = df$Sub_metering_1, axes=F, type="l", xlab="", ylab=ylab, cex.lab=cex)
lines(x = df$Date_Time, y = df$Sub_metering_2, col="red")
lines(x = df$Date_Time, y = df$Sub_metering_3, col="blue")
legend("topright", cex=0.6, lty=1, legend=legend, col=col, bty = "n")
box(lwd=2, col="gray")
# axis(side=1, weeks_pos, weeks_nam, cex.axis=cex)
axis.POSIXct(1, at=seq(daterange[1], daterange[2], by="day"), format="%a") #label the x axis by weekday
axis(side=2, cex.axis=cex)

# Display plot4
xlab <- "datetime"
ylab <- "Global_reactive_power"
plot(x = df$Date_Time, y = df$Global_reactive_power, axes=F, type="l", xlab=xlab, ylab=ylab, cex.lab=cex)
box(lwd=2, col="gray")
# axis(side=1, weeks_pos, weeks_nam, cex.axis=cex)
axis.POSIXct(1, at=seq(daterange[1], daterange[2], by="day"), format="%a") #label the x axis by weekday
axis(side=2, cex.axis=cex)

par(mfrow=c(1,1))

# Save plot to file
dev.copy(png, "plot4.png", width=480 , height=480)
dev.off()

