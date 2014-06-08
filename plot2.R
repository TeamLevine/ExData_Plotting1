## plot2.R
## Constructs the first plot for the Exploratory Data Analysis Course
ConstructPlot2 <- function () {
  ## read in and construct the subset needed of the data  
  hpc <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
  hpc <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
  hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
  hpc$dt <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
  
  ## construct the base plot
  with(hpc, plot(dt,Global_active_power, type="n"))
  with(hpc, lines(dt,Global_active_power, type="l"))
  dev.copy(png, filename="~/ExData_Plotting1/plot2.png", width=480, height=480, units="px");
  dev.off ();
}