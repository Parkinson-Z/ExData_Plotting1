#The dataset("household_power_consumption.txt") in the current directory has 2,075,259 rows and 9 columns. 
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#Name each of the plot files as plot1.png, plot2.png, etc.

  t1 <- as.Date("1/2/2007","%d/%m/%Y")		#Feb-01-2007
  t2 <- as.Date("2/2/2007","%d/%m/%Y")		#Feb-02-2007
  tb <- read.csv("household_power_consumption.txt",sep=";",colClasses=c(rep("character",2),rep("numeric",7)),na.strings="?")

  tt <- as.Date(tb$Date,"%d/%m/%Y")
  tb <- tb[which(tt == t1 | tt == t2),]		#select t1 and t2 only
  tb <- tb[!is.na(tb[,5]),]			#remove NA

  png(filename="plot2.png",width=480,height=480,bg="white")

  x <- strptime(paste(tb$Date,tb$Time),"%d/%m/%Y %H:%M:%S");
  plot(x,tb$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")

  dev.off()
