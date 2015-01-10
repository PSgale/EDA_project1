source("Data.R")

# Get data
file_name <- "household_power_consumption.txt" 
date_from <- "2007-02-01"
date_till <- "2007-02-03"
df <- Read_Data(file_name, date_from, date_till)

cex <- 0.7
# weeks_nam <- names(table(df$Weekday))
# weeks_pos <- lapply(names(table(df$Weekday)), function(x){floor(median(which(df$Weekday == x)))})
daterange <- c(as.POSIXlt(min(df$Date_Time)),as.POSIXlt(max(df$Date_Time)))   #figure out the lowest and highest dates


# Display plot on screen
col <- c("black", "red", "blue")
legend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
ylab <- "Energy sub metering"
plot(x = df$Date_Time, y = df$Sub_metering_1, col=col[1], axes=F, type="l", xlab="", ylab=ylab, cex.lab=cex)
lines(x = df$Date_Time, y = df$Sub_metering_2, col=col[2])
lines(x = df$Date_Time, y = df$Sub_metering_3, col=col[3])
legend("topright", cex=cex, lty=1, legend=legend, col=col, box.lwd=2, box.col="gray")
box(lwd=2, col="gray")
# axis(side=1, weeks_pos, weeks_nam, cex.axis=cex)
axis.POSIXct(1, at=seq(daterange[1], daterange[2], by="day"), format="%a") #label the x axis by weekday
axis(side=2, cex.axis=cex)

# Save plot to file
dev.copy(png, "plot3.png", width=480 , height=480)
dev.off()
