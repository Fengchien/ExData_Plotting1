plot2 <- function() {

	pw = read.csv("./household_power_consumption.txt", sep=";")
	pw2 = subset(pw, strptime(pw$Date, "%d/%m/%Y") >= strptime("2007-02-01", "%Y-%m-%d") & strptime(pw$Date, "%d/%m/%Y") <= strptime("2007-02-02", "%Y-%m-%d") )
	#write.table(pw2, file="./filteredpw.txt", sep=" ", row.name=FALSE)
	png(filename = "plot2.png", width = 480, height = 480, units = "px");
	plot(as.numeric(as.character(pw2$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)", axes=F, xlab="");
	axis(1, at=c(0, nrow(pw2)/2, nrow(pw2)), labels=c("Thu", "Fri", "Sat"));
	axis(2, at=seq(0,6,by=2));
	box();
	dev.off();
}
