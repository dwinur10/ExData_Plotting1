# Read data from local directory
     raw.dat <- read.table('./Explore data/household_power_consumption.txt', header = T,sep = ';', na.strings = '?')

# Subset data from 2007-02-01 and 2007-02-02
     sub.dat <- subset(raw.dat, Date == '1/2/2007' | Date == '2/2/2007')

# Correct date and time variable to the correct class
     sub.dat$Date <- as.Date(sub.dat$Date, format = '%d/%m/%Y')

# Construct plot and save it to PNG file
     windows(width = 10, height = 10)
     hist(sub.dat$Global_active_power,
          col = 'red',
          xlab = 'Global Active Power (kilowatts)',
          main = 'Global Active Power')
     
     dev.copy(png, 'plot1.png', height = 480, width = 480)
     dev.off()
     