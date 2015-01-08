source("Data.R")

# Get data
file_name <- "household_power_consumption.txt" 
date_from <- "2007-02-01"
date_till <- "2007-02-02"
df <- Read_Data(file_name, date_from, date_till)

cex <- 0.7
weeks_nam <- names(table(df$Weekday))
weeks_pos <- lapply(names(table(df$Weekday)), function(x){floor(median(which(df$Weekday == x)))})

# Display plot on screen
col <- c("black", "red", "blue")
legend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
ylab <- "Energy sub metering"
plot(df$Sub_metering_1, col=col[1], axes=F, type="l", xlab="", ylab=ylab, cex.lab=cex)
lines(df$Sub_metering_2, col=col[2])
lines(df$Sub_metering_3, col=col[3])
legend("topright", cex=cex, lty=1, legend=legend, col=col, box.lwd=2, box.col="gray")
box(lwd=2, col="gray")
axis(side=1, weeks_pos, weeks_nam, cex.axis=cex)
axis(side=2, cex.axis=cex)

# Save plot to file
dev.copy(png, "plot3.png", width=480 , height=480)
dev.off()

