plot3 <- function() {

	pw = read.csv("./household_power_consumption.txt", sep=";")
	pw2 = subset(pw, strptime(pw$Date, "%d/%m/%Y") >= strptime("2007-02-01", "%Y-%m-%d") & strptime(pw$Date, "%d/%m/%Y") <= strptime("2007-02-02", "%Y-%m-%d") )
	rm(pw);

	png(filename = "plot3.png", width = 480, height = 480, units = "px");
	
	pw2$DateTime <- strptime(paste(pw2$Date, pw2$Time), "%d/%m/%Y %H:%M:%S");
	Sys.setlocale("LC_TIME", "English");
	plot(pw2$DateTime, pw2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="");
	lines(pw2$DateTime, pw2$Sub_metering_3, type="l", col="blue");
	lines(pw2$DateTime, pw2$Sub_metering_2, type="l", col="red");

	legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5, 2.5),col=c("black","red", "blue"));
	dev.off();
}