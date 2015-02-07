load_data <- function(){
  data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";")
  data[
    (data$Date == "1/2/2007" | data$Date == "2/2/2007") &
      data$Global_active_power != "?" & 
      data$Sub_metering_1 != "?" &
      data$Sub_metering_2 != "?" &
      data$Sub_metering_3 != "?",]
}
clean_data <- function(data){
  dates <- as.Date(data$Date, format="%d/%m/%Y")
  within(data=data, expr={
    Sub_metering_1 <- as.numeric(levels(Sub_metering_1))[Sub_metering_1]
    Sub_metering_2 <- as.numeric(levels(Sub_metering_2))[Sub_metering_2]
    DateTime <- as.POSIXct(paste(dates, Time), format="%Y-%m-%d %H:%M:%S")
    Date <- dates
    Global_active_power <- as.numeric(levels(Global_active_power))[Global_active_power]
    Global_reactive_power <- as.numeric(levels(Global_reactive_power))[Global_reactive_power]
    Voltage <- as.numeric(levels(Voltage))[Voltage]
  })
}


process_data <- function(){
  data <- load_data()
  data <- clean_data(data)
  create_and_save_picture(data)
}