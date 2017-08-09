plot6 <- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  vehicleSource <- SCC[grep('vehicle', SCC$Short.Name,ignore.case =  TRUE),]
  VehicleEmission <- NEI[NEI$SCC %in%  vehicleSource$SCC,]
  BaltimorevehicleEmission <- VehicleEmission[VehicleEmission$fips== "24510",]
  LAEmissions <- VehicleEmission[VehicleEmission$fips == "06037",]
  TotalEmissionBalti <- aggregate(Emissions ~ year, BaltimorevehicleEmission, sum)
  TotalEmissionLA <- aggregate(Emissions ~ year, LAEmissions, sum)
  TotalEmissionBalti$City <- "Baltimore"
  TotalEmissionLA$City <- "Los Angeles"
  TotalEmissionsMerged <- rbind(TotalEmissionBalti,TotalEmissionLA)
  png('plot6.png')
  out <- qplot(year, Emissions, data = TotalEmissionsMerged, facets = .~City, geom = c("point","smooth"), method = "lm")
  print(out)
  dev.off()
}

