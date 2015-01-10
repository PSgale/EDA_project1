Read_Data <- function(file_name, date_from, date_till)
{
  f <- file(file_name, "r")
  head <- strsplit(readLines(f, n=1), ";")
  data <- matrix(, nrow = 0, ncol = 7)
  
  Date_Time <- NULL
  data_from <- strptime(date_from, format="%Y-%m-%d")
  data_till <- strptime(date_till, format="%Y-%m-%d")
  
  line <- readLines(f, n=1)
  while (!is.null(line))
  {
    line <- strsplit(line, ";")
    Date_Time_ <- strptime(paste(line[[1]][1] , line[[1]][2]), format="%d/%m/%Y %H:%M:%S")
    
    if ((Date_Time_ >= data_from) && (Date_Time_ <= data_till))
    {
      if (is.null(Date_Time)) {Date_Time <- Date_Time_} 
      else {Date_Time <- c(Date_Time, Date_Time_)}
      
      data <- rbind(data, line[[1]][-c(1:2)]);
    }
    else if (Date_Time_ >= data_till)
    {
      break;
    }
    
    line <- readLines(f, n=1)
  }
  close(f)
  
  df <- data.frame(data)
  names(df) <- head[[1]][-c(1:2)]
  
  df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  df$Voltage <- as.numeric(as.character(df$Voltage))
  
  df$Date_Time <- Date_Time
  df$Weekday <- weekdays(Date_Time, abbreviate=TRUE)
  
  return(df)
}

# df <- Read_Data("household_power_consumption.txt", "2007-02-01", "2007-02-02")
