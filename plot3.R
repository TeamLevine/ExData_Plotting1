## plot3.R
## Constructs the first plot for the Exploratory Data Analysis Course
ConstructPlot3 <- function () {
  ## read in and construct the subset needed of the data  
  hpc <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
  hpc <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
  hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
  hpc$dt <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
  
  ## construct the base plot
  with (hpc, plot(dt,Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
  with (hpc, lines(dt,Sub_metering_1, type="l"))  
  with (hpc, lines(dt,Sub_metering_2, type="l", col="red"))  
  with (hpc, lines(dt,Sub_metering_3, type="l", col="blue"))  
  legend(x = "topright",  
         bty = "n",         
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   
         lty=c(1, 1, 1),   
         lwd=c(2.5, 2.5, 2.5),  
         col=c("black", "red", "blue")
  )
  dev.copy(png, filename="~/ExData_Plotting1/plot3.png", width=480, height=480, units="px");
  dev.off ();
}