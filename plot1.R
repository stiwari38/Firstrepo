plot1 <- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  TotalEmission <- aggregate(Emissions ~ year, NEI, sum)
  png('plot1.png')
  with(TotalEmission, plot(year, Emissions/1000, xaxt="n",type = "l",col = "blue",main = "PM 2.5 trend", ylab = "PM 2.5 emissions in Kilotonnes", xlab = "Year"))
  axis(1, at = seq(1999, 2008, by = 3))  
  points(TotalEmission$Emissions/1000 ~ TotalEmission$year)
  dev.off()
}