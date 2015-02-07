source("base_plotting_script.R")

plot_multilines <- function(data){
  colors <- c("black", "red", "blue")
  names <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  dt <- data$DateTime
  yrange <- range(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3))
  plot(
    dt, 
    data$Sub_metering_1, 
    ylim=yrange, 
    col="black", 
    type="l",
    xlab="",
    ylab="Energy sub metering")
  lines(dt, data$Sub_metering_2, col="red", type="l")
  lines(dt, data$Sub_metering_3, col="blue", type="l")
  legend('topright', names, col=colors, lty=1, bg="transparent", cex=0.5)
}
create_and_save_picture <- function(data){
  png("Plot3.png", height=480, width=480, unit="px")  
  plot_multilines(data)
  dev.off()
}