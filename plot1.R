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
png(filename="plot1.png",width=480,height=480)
par(bg=NA)
hist(raw_sel[,3],main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
