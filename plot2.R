plot2 <- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  NEI <- NEI[NEI$fips  == "24510",]
  TotalEmission <- aggregate(Emissions ~ year, NEI, sum)
  png('plot2.png')
  with(TotalEmission, plot(year, Emissions/1000,type = "l",col = "blue",main = "PM 2.5 trend in Baltimore City, Maryland", ylab = "PM 2.5 emissions in Kilotonnes", xlab = "Year"))
  points(TotalEmission$Emissions/1000 ~ TotalEmission$year)
  dev.off()
}