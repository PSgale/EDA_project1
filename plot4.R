source("Data.R")

# Get data
file_name <- "household_power_consumption.txt" 
date_from <- "2007-02-01"
date_till <- "2007-02-02"
df <- Read_Data(file_name, date_from, date_till)

# Display plot on screen
par(mfrow=c(2,2))
cex <- 0.7
weeks_nam <- names(table(df$Weekday))
weeks_pos <- lapply(names(table(df$Weekday)), function(x){floor(median(which(df$Weekday == x)))})

# Display plot1
ylab <- "Global Active Power"
plot(df$Global_active_power, axes=F, type="l", xlab="", ylab=ylab, cex.lab=cex)
box(lwd=2, col="gray")
axis(side=1, weeks_pos, weeks_nam, cex.axis=cex)
axis(side=2, cex.axis=0.7)

# Display plot2
plot(df$Voltage, axes=F, type="l", xlab="datetime", ylab="Voltage", cex.lab=cex)
box(lwd=2, col="gray")
axis(side=1, weeks_pos, weeks_nam, cex.axis=cex)
axis(side=2, cex.axis=cex)

# Display plot3
col <- c("black", "red", "blue")
legend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
ylab <- "Energy sub metering"
plot(df$Sub_metering_1, axes=F, type="l", xlab="", ylab=ylab, cex.lab=cex)
lines(df$Sub_metering_2, col="red")
lines(df$Sub_metering_3, col="blue")
legend("topright", cex=0.6, lty=1, legend=legend, col=col, bty = "n")
box(lwd=2, col="gray")
axis(side=1, weeks_pos, weeks_nam, cex.axis=cex)
axis(side=2, cex.axis=cex)

# Display plot4
xlab <- "datetime"
ylab <- "Global_reactive_power"
plot(df$Global_reactive_power, axes=F, type="l", xlab=xlab, ylab=ylab, cex.lab=cex)
box(lwd=2, col="gray")
axis(side=1, weeks_pos, weeks_nam, cex.axis=cex)
axis(side=2, cex.axis=cex)

par(mfrow=c(1,1))

# Save plot to file
dev.copy(png, "plot4.png", width=480 , height=480)
dev.off()
