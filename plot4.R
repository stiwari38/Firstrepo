plot4 <- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  coalSources <- SCC[grep('\\bCoal\\b',SCC$Short.Name),]
  DataUSCoal <- NEI[NEI$SCC %in%  coalSources$SCC,]
  TotalEmission <- aggregate(Emissions ~ year, DataUSCoal, sum)
  png('plot4.png')
  with(TotalEmission, plot(year, Emissions/1000, xaxt="n",type = "l",col = "blue",main = "PM 2.5 trend for coal based sources", ylab = "PM 2.5 emissions in Kilotonnes", xlab = "Year"))
  axis(1, at = seq(1999, 2008, by = 3))  
  points(TotalEmission$Emissions/1000 ~ TotalEmission$year)
  dev.off()
}