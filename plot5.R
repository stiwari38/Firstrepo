plot5 <- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  vehicleSource <- SCC[grep('vehicle', SCC$Short.Name,ignore.case =  TRUE),]
  VehicleEmission <- NEI[NEI$SCC %in%  vehicleSource$SCC,]
  BaltimorevehicleEmission <- VehicleEmission[VehicleEmission$fips== "24510",]
  TotalEmission <- aggregate(Emissions ~ year, BaltimorevehicleEmission, sum)
  png('plot5.png')
  with(TotalEmission, plot(year, Emissions/1000, xaxt="n",type = "l",col = "blue",main = "PM 2.5 trend for motor vehicle sources in Baltimore", ylab = "PM 2.5 emissions in Kilotonnes", xlab = "Year"))
  axis(1, at = seq(1999, 2008, by = 3))  
  points(TotalEmission$Emissions/1000 ~ TotalEmission$year)
  dev.off()
}

