# Loading the data
raw_data <- read.delim("./Course_Project_1/household_power_consumption.txt",
    header = TRUE, sep = ";"
)
library(dplyr)
data1 <- filter(raw_data, Date == "1/2/2007" | Date == "2/2/2007")
data1 <- mutate(data1, Global_active_power = as.numeric(Global_active_power))

png(file = "./Course_Project_1/plot1.png")
hist(data1$Global_active_power,
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)",
    col = "red"
)
dev.off()