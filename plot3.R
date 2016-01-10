setwd("C:\\Users\\stevecsp\\Documents\\R-Learn\\eda_hw1\\ExData_p1")
df <- read.table("household_power_consumption.txt", sep = ";", header = T, nrows = 100000, na.strings = "?", stringsAsFactors = F)

df$datetime <- strptime(as.character(paste(df$Date,df$Time)), "%d/%m/%Y %H:%M:%S")
df = subset(df, as.Date(datetime) %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

par(mfrow = c(1,1))
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
with(df, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(df, lines(datetime,Sub_metering_1, col = "black"))
with(df, lines(datetime,Sub_metering_2, col = "red"))
with(df, lines(datetime,Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()