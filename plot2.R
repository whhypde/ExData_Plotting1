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

png(file = "./Course_Project_1/plot2.png")
plot(x = data2$Datetime, y = data2$Global_active_power, type = "l",
xlab = "weekday", ylab = "Global Active Power (kilowatts)")
dev.off()