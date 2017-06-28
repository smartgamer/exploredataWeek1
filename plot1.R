XXXXXXX
#coursera exploratory data analysis. week1 project
#This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site:
#Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
#https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

Making Plots

Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.

First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1

For each plot you should

Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
Name each of the plot files as plot1.png, plot2.png, etc.
Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)

When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.

The four plots that you will need to construct are shown below.

# load Electric power consumption datasets
hhpcData <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T)
#hhpcData <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = F)
hhpcData <- read.table("household_power_consumption.txt", sep = ";", header = T)
hhpcData= as.matrix(hhpcData)
#colnames(hhpcData)<-as.character(unlist(hhpcData[1,]))
#head(hhpcData)
#hhpcData<-hhpcData[-1,]
head(hhpcData); tail(hhpcData)
summary(hhpcData)
str(hhpcData)

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

png(filename='plot1.png', width=480, height=480, units='px')
hist(dataToUse$Global_active_power,xlab="Global Active Power(killowats)", ylab="Frequency", main="Global active power", col="red")
dev.off()




