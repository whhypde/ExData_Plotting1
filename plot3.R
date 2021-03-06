# Loading the data
raw_data <- read.delim("./Course_Project_1/household_power_consumption.txt",
    header = TRUE, sep = ";"
)
library(tidyverse)
data1 <- filter(raw_data, Date == "1/2/2007" | Date == "2/2/2007")
data2 <- mutate(data1,
    Global_active_power = as.numeric(Global_active_power),
    Datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
)

png(file = "./Course_Project_1/plot3.png")
plot(
    x = data2$Datetime, y = data2$Sub_metering_1, type = "l",
    col = "black", xlab = "weekday", ylab = "Energy sub metering"
)
lines(
    x = data2$Datetime, y = data2$Sub_metering_2, type = "l",
    col = "red"
)
lines(
    x = data2$Datetime, y = data2$Sub_metering_3, type = "l",
    col = "blue"
)
legend(
    x = "topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"),
    lty = 1:2, pch = 1, cex = 0.7, pt.cex = 1
)
dev.off()