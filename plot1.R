plot1 <- function() {

	pw = read.csv("./household_power_consumption.txt", sep=";")
	pw2 = subset(pw, strptime(pw$Date, "%d/%m/%Y") >= strptime("2007-02-01", "%Y-%m-%d") & strptime(pw$Date, "%d/%m/%Y") <= strptime("2007-02-02", "%Y-%m-%d") )
	#write.table(pw2, file="./filteredpw.txt", sep=" ", row.name=FALSE)

	png(filename = "plot1.png", width = 480, height = 480, units = "px");
	hist(as.numeric(as.character(pw2$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatt)", axes=F);
	axis(1, at=seq(0,6,by=0.5), labels=c(0,"","","",2,"","","",4,"","","",6));
	axis(2, at=seq(0,1200,by=200), labels=seq(0,1200,by=200));
	dev.off();

}