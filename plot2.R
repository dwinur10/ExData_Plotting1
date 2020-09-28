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
     plot(sub.dat$DateTime,
          sub.dat$Global_active_power,
          type = 'l',
          ylab = 'Global Active Power (kilowatts)', 
          xlab = "")
     
     dev.copy(png, 'plot2.png', width = 480, height = 480)
     dev.off()
     