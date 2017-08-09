plot3 <- function(){
  library('ggplot2')
  NEI <- readRDS("summarySCC_PM25.rds")
  NEI <- NEI[NEI$fips  == "24510",]
  TotalEmission <- aggregate(Emissions ~ year + type, NEI, sum)
  png('plot3.png')
  out <- qplot(year, Emissions, data = TotalEmission, facets = .~type, geom = c("point","smooth"), method = "lm")
  print(out)
  dev.off()
}