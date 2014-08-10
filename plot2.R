## Reading the data into R
raw<-read.table("./household_power_consumption.txt",header = T, sep=";",colClasses=c("character","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL"))
raw[,1] <- as.Date(raw[,1],"%d/%m/%Y")
selectDate <- raw[,1] == as.Date("2007-02-01") | raw[,1] == as.Date("2007-02-02")
minD <- min(which(selectDate==T))
lonD <- sum(selectDate)
raw2<-read.table("./household_power_consumption.txt",header = T, sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), nrows=5)
raw_sel<-read.table("./household_power_consumption.txt",header = T, sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), skip = minD-1, nrows=lonD)
raw_sel[,1] <- as.Date(raw_sel[,1],"%d/%m/%Y")
colnames(raw_sel) <- colnames(raw2)

## Plotting and writing PNG file
raw_sel[,10] <- as.POSIXct(paste(raw_sel[,1],raw_sel[,2]))
colnames(raw_sel)[10] <- "Date-Time"
png(filename="plot2.png",width=480,height=480)
par(bg=NA)
plot(raw_sel[,10],raw_sel[,3],ylab="Global Active Power (kilowatts)",xlab=NA,type='l')
dev.off()
