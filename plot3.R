#Read data
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

#Subset required data
df_analysis <- subset(df, df$Date %in% c('1/2/2007','2/2/2007'))

#Date conversion
df_analysis$Date <- as.Date(df_analysis$Date, format="%d/%m/%Y")
dt <- paste(as.Date(df_analysis$Date), df_analysis$Time)
df_analysis$datetime <- as.POSIXct(dt)

#Plot graph and lines, and set legends
with(df_analysis, {
    plot(Sub_metering_1~datetime, type="l", xlab = "",
         ylab="Energy sub metering")
    lines(Sub_metering_2~datetime,col='Red')
    lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Write output to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()