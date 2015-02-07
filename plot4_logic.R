source("base_plotting_script.R")
source("plot1_logic.R")
source("plot2_logic.R")
source("plot3_logic.R")

plot_voltage <- function(data){
  plot(
    data$DateTime,
    data$Voltage,
    col="black",
    xlab="datetime",
    ylab="Voltage",
    type="l")
}
plot_reacive_power <- function(data){
  plot(
    data$DateTime,
    data$Global_reactive_power,
    col="black",
    xlab="datetime",
    ylab="Global_reactive_power",
    type="l")
}
plot_multiple <- function(data){
  par(mfrow=c(2,2))
  plot_global_active_power_against_datetime(data)
  plot_voltage(data)
  plot_multilines(data)
  plot_reacive_power(data)
  
}
create_and_save_picture <- function(data){
  png("Plot4.png", height=480, width=480, unit="px")  
  plot_multiple(data)
  dev.off()
}