#Read data
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

#Subset required data
df_analysis <- subset(df, df$Date %in% c('1/2/2007','2/2/2007'))

#Date conversion
df_analysis$Date <- as.Date(df_analysis$Date, format="%d/%m/%Y")
dt <- paste(as.Date(df_analysis$Date), df_analysis$Time)
df_analysis$datetime <- as.POSIXct(dt)

#Plot graph
plot(df_analysis$Global_active_power~df_analysis$datetime, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

#Write output to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()