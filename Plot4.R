## plot4.R
## Constructs the first plot for the Exploratory Data Analysis Course
ConstructPlot4 <- function () {
  ## read in and construct the subset needed of the data  
  hpc <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
  hpc <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
  hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
  hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
  
  png("~/ExData_Plotting1/plot4.png", width=480, height=480)
  par(mfrow=c(2,2))

  ## plot 1
  hist(hpc$Global_active_power, 
       col="red", 
       xlab="Global Active Power (kilowatts)", 
       main="Global Active Power")
  
  ## plot 2
  with(hpc, plot(datetime,Global_active_power, type="n"))
  with(hpc, lines(datetime,Global_active_power, type="l"))
  
  ## plot 3
  with (hpc, plot(datetime,Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
  with (hpc, lines(datetime,Sub_metering_1, type="l"))  
  with (hpc, lines(datetime,Sub_metering_2, type="l", col="red"))  
  with (hpc, lines(datetime,Sub_metering_3, type="l", col="blue"))  
  legend(x = "topright",  
         bty = "n",         
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   
         lty=c(1, 1, 1),   
         lwd=c(2.5, 2.5, 2.5),  
         col=c("black", "red", "blue")
  )
  
  ## plot 4
  with (hpc, plot(datetime,Global_reactive_power, type="n"))
  with (hpc, lines(datetime,Global_reactive_power, type="l"))  
  
  dev.off ();
}