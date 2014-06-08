## plot1.R
## Constructs the first plot for the Exploratory Data Analysis Course
ConstructPlot1 <- function () {
  ## read in and construct the subset needed of the data  
  hpc <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
  hpc <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
  
  ## construct the base plot
  hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
  hist(hpc2$Global_active_power, 
       col="red", 
       xlab="Global Active Power (kilowatts)", 
       main="Global Active Power")
  dev.copy(png, filename="~/ExData_Plotting1/plot1.png", width=480, height=480, units="px");
  dev.off ();
  }