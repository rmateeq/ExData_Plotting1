#Read data
df <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

#Subset required data
df_analysis <- subset(df, df$Date %in% c('1/2/2007','2/2/2007'))

#Draw histogram
hist(df_analysis$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Write output to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()