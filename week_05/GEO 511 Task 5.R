library(spData)
library(sf)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(units) #this one is optional, but can help with unit conversions.
# load world data from spData package
data(world)  
# load states boundaries from spData package
data(us_states) 
# plot(world[1])  #plot if desired
# plot(us_states[1]) #plot if desired

#Required crs
albers="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

#this section of code was helped by Zixuan
#World with crs attached
T_World <- world %>%
#?st_transform
#Single out Canada to set up buffer
filter(name_long == "Canada") %>%
st_transform(T_World, crs = albers)
  Canada_Buffer <- st_buffer(T_World, 10000)
st_crs(Canada_Buffer)
#US transformation w/ crs
NYS <- us_states %>% filter(NAME == "New York")
st_transform(NYS, crs = albers)

#Create border object
border_object <- st_intersection(Canada_Buffer, NYS)
sol_map <- ggplot(NYS)+
geom_sf()+
geom_sf(border_object, aes(fill = "red"))+
  labs(title = "New York Land Within 10km")

a_unit <- set_units(st_area(border_object),km^2)
print(sol_map)
