plot1 <- function()
{
  data <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
  data$Date <-  as.Date(data$Date, "%d/%m/%Y")
  data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  
  png(filename = "plot1.png", 
      width = 480, 
      height = 480)
  hist(temp3$Global_active_power, 
       main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)", 
       ylab = "Frequency",
       freq = TRUE, 
       col = "red", 
       ylim = c(0,1200))
  dev.off()
}