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
ylab <- "Global Active Power (kilowatts)"
plot(df$Global_active_power, axes=F, type="l", xlab = "", ylab=ylab, cex.lab=cex)
box(lwd=2, col="gray")
axis(side=1, weeks_pos, weeks_nam, cex.axis=cex)
axis(side=2, cex.axis=cex)
# TO-DO xaxis

# Save plot to file
dev.copy(png, "plot2.png", width=480 , height=480)
dev.off()
