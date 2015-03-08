plot4 <- function() {

	pw = read.csv("./household_power_consumption.txt", sep=";")
	pw2 = subset(pw, strptime(pw$Date, "%d/%m/%Y") >= strptime("2007-02-01", "%Y-%m-%d") & strptime(pw$Date, "%d/%m/%Y") <= strptime("2007-02-02", "%Y-%m-%d") )
	rm(pw);
	#write.table(pw2, file="./filteredpw.txt", sep=" ", row.name=FALSE)
	png(filename = "plot4.png", width = 480, height = 480, units = "px");

	par(mfrow=c(2,2));

	plot(as.numeric(as.character(pw2$Global_active_power)), type="l", ylab="Global Active Power", axes=F, xlab="");
	axis(1, at=c(0, nrow(pw2)/2, nrow(pw2)), labels=c("Thu", "Fri", "Sat"));
	axis(2, at=seq(0,6,by=2));
	box();

	plot(as.numeric(as.character(pw2$Voltage)), type="l", ylab="Voltage", axes=F, xlab="datetime");
	axis(1, at=c(0, nrow(pw2)/2, nrow(pw2)), labels=c("Thu", "Fri", "Sat"));
	axis(2, at=seq(234, 246, by=4));
	box();

	plot(as.numeric(as.character(pw2$Sub_metering_1)), type="l", ylab="Energy sub metering", axes=F, xlab="");
	lines(as.numeric(as.character(pw2$Sub_metering_2)), type="l", col="red");
	lines(as.numeric(as.character(pw2$Sub_metering_3)), type="l", col="blue");
	axis(1, at=c(0, nrow(pw2)/2, nrow(pw2)), labels=c("Thu", "Fri", "Sat"));
	axis(2, at=c(0, 10,20,30));
	box();
	legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty="n", lty=c(1,1,1), lwd=c(2.5,2.5, 2.5),col=c("black","red", "blue"));

	plot(as.numeric(as.character(pw2$Global_reactive_power)), type="l", ylab="Global_reactive_power", axes=F, xlab="datetime");
	axis(1, at=c(0, nrow(pw2)/2, nrow(pw2)), labels=c("Thu", "Fri", "Sat"));
	axis(2, at=seq(0.0, 0.5, by=0.1));
	box();

	dev.off();
}