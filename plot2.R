XXXX
#coursera exploratory data analysis. week1 project

# load Electric power consumption datasets
hhpcData <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T)
head(hhpcData); tail(hhpcData)
summary(hhpcData)
str(hhpcData)
dim(hhpcData)

#library(plyr)
library(dplyr)
#hhpcData$Date= as.Date(hhpcData$Date,'%d/%m/%Y')
hhpcData=mutate(hhpcData, Date = as.Date(Date, '%d/%m/%Y'))
hhpcData=mutate(hhpcData, Time = as.POSIXct(strptime(paste(Date, ' ', hhpcData$Time), '%Y-%m-%d %H:%M:%S')))
dataToUse <- filter(hhpcData, Time >= strftime('2007-02-01 00:00:00'), Time < strftime('2007-02-03 00:00:00'))
head(dataToUse)
tail(dataToUse)
str(dataToUse)
dataToUse$Global_active_power= as.numeric(dataToUse$Global_active_power)

data=dataToUse

png(filename='plot2.png', width=480, height=480, units='px')
startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
endDay = as.POSIXct(strftime("2007-02-03 00:00:00"))
plot(data$Time,
     data$Global_active_power,
     xlim=c(startDay, endDay),
     xaxt="n",
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
)
axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")
dev.off()



















