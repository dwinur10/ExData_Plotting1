# Read data from local directory
     raw.dat <- read.table('./Explore data/household_power_consumption.txt', header = T,sep = ';', na.strings = '?')

# Subset data from 2007-02-01 and 2007-02-02
     sub.dat <- subset(raw.dat, Date == '1/2/2007' | Date == '2/2/2007')

# Correct date and time variable to the correct class
     sub.dat$Date <- as.Date(sub.dat$Date, format = '%d/%m/%Y')

# Add new variable called DateTime, consist of Variable Date and Time
     DT <- paste(sub.dat$Date, sub.dat$Time)
     sub.dat$DateTime <- as.POSIXct(DT, tz = "", '%Y-%m-%d %H:%M:%S')

# Construct plot and save it to PNG file
     windows(width = 10, height = 10)
     par(mfrow = c(2,2), mar = c(4,4,1,1))
     
     with(sub.dat, plot(DateTime, Global_active_power, type = 'l',
                        xlab = '', ylab = 'Global Active Power'))
     
     with(sub.dat, plot(DateTime, Voltage, type = 'l',
                        xlab = 'datetime',
                        ylab = 'Voltage'))
     
     with(sub.dat,{
          plot(DateTime, Sub_metering_1, type = 'l',
               xlab = '', ylab = 'Energy sub metering')
          lines(DateTime, Sub_metering_2, col = 'red')
          lines(DateTime, Sub_metering_3, col = 'blue')
          legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
                 col = c('black', 'red','blue'), lty = 1, lwd = 2, cex = 0.9)})
     
     with(sub.dat,
          plot(DateTime, Global_reactive_power,
               type = 'l', xlab = 'datetime',
               ylab = 'Global_reactive_power'))
     
     dev.copy(png, 'plot4.png', width = 480, height = 480)
     dev.off()