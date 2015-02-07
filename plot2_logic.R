source("base_plotting_script.R")

plot_global_active_power_against_datetime <- function(data){
  plot(
    data$DateTime,
    data$Global_active_power,
    type="l",
    xlab="",
    ylab="Global active power (kilowatts)")
}
create_and_save_picture <- function(data){
  png("Plot2.png", height=480, width=480, unit="px")  
  plot_global_active_power_against_datetime(data)
  dev.off()
}