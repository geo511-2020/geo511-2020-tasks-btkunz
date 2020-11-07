library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)
library(ncdf4)

data(world)  #load 'world' data from spData package
tmax_monthly <- getData(name = "worldclim", var="tmax", res=10)

#download.file("https://crudata.uea.ac.uk/cru/data/temperature/absolute.nc","crudata.nc")
tmean <- raster("absolute.nc")

new_world <- world %>% st_simplify(1) %>%

  filter(continent != "Antarctica")

sp_world <- as(new_world,"Spatial") 

#plot(tmax_monthly)
#?gain()
crs(tmax_monthly)
#gain(tmax_monthly) = ????

tmax_annual <- max(tmax_monthly)
names(tmax_annual) <- "tmax"
max_temp <- st_as_sf(raster::extract(tmean, sp_world, fun = max, na.rm=T, small=T, sp=T))

sp_map <- ggplot(max_temp) +
  geom_sf(aes(fill = tmax)) +
  scale_fill_viridis_c(name="Annual\nMaximum\nTemperature (C)")+
  theme(legend.position = 'bottom')



plot(sp_map)
