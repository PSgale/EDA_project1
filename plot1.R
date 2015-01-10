source("Data.R")

# Get data
file_name <- "household_power_consumption.txt" 
date_from <- "2007-02-01"
date_till <- "2007-02-03"
df <- Read_Data(file_name, date_from, date_till)

cex <- 0.7

# Display plot on screen
main <- "Global Active Power"
xlab <- "Global Active Power (kilowatts)"
hist(df$Global_active_power, breaks=15, col="red", xlab=xlab, main=main, cex.main=0.8, cex.axis=cex, cex.lab=cex)

# Save plot to file
dev.copy(png, "plot1.png", width=480 , height=480)
dev.off()
