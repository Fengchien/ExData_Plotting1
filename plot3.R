plot3 <- function() {

	pw = read.csv("./household_power_consumption.txt", sep=";")
	pw2 = subset(pw, strptime(pw$Date, "%d/%m/%Y") >= strptime("2007-02-01", "%Y-%m-%d") & strptime(pw$Date, "%d/%m/%Y") <= strptime("2007-02-02", "%Y-%m-%d") )
	#write.table(pw2, file="./filteredpw.txt", sep=" ", row.name=FALSE)
	png(filename = "plot3.png", width = 480, height = 480, units = "px");
	plot(as.numeric(as.character(pw2$Sub_metering_1)), type="l", ylab="Energy sub metering", axes=F, xlab="");
	lines(as.numeric(as.character(pw2$Sub_metering_2)), type="l", col="red");
	lines(as.numeric(as.character(pw2$Sub_metering_3)), type="l", col="blue");
	axis(1, at=c(0, nrow(pw2)/2, nrow(pw2)), labels=c("Thu", "Fri", "Sat"));
	axis(2, at=c(0, 10,20,30));
	box();
	legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5, 2.5),col=c("black","red", "blue"));
	dev.off();
}