source("base_plotting_script.R")

plot_global_active_power <- function(data){
  hist(
    data$Global_active_power,
    col="red",
    main="Global Active Power",
    xlab="Global active power (kilowatts)")
}
create_and_save_picture <- function(data){
  png("Plot1.png", height=480, width=480, unit="px")  
  plot_global_active_power(data)
  dev.off()
}