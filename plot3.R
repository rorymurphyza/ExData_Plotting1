plot3 <- function()
{
  data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
  data$Date <-  as.Date(data$Date, "%d/%m/%Y")
  data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
  data$Date <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
  
  
  png(filename = "plot3.png", 
      width = 480, 
      height = 480)
  plot(data$Date, 
       data$Sub_metering_1, 
       col = "black", 
       type = "l",
       xlab = "",
       ylab = "Energy sub metering")
  lines(data$Date, data$Sub_metering_2, col = "red", type = "l")
  lines(data$Date, data$Sub_metering_3, col = "blue", type = "l")
  legend("topright",
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lwd = 2,
         col = c("black", "red", "blue"))
  
  dev.off()
}