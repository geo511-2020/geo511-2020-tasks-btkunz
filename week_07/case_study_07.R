library(ggplot2)
library(tidyverse)
library(reprex)
library(spData)
library(sf)

data(world)
#helped by Hadarou on line below
gdp_plot <- ggplot(world, aes(x = gdpPercap, fill = continent))+
  geom_density(alpha = 0.5, color = F)+
  labs(x = "GDP per Capita",
       y = "Density",
       fill = "Continent") +
  
  theme(legend.position = "bottom")

plot(gdp_plot)

#reprex::reprex()