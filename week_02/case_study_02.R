library(tidyverse)

dataurl = "https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.csv"

temp = read_csv(dataurl, skip = 1,
                na = "999.90",
                col_names = c("YEAR", "JAN", "FEB", "MAR",
                              "APR", "MAY", "JUN", "JUL",
                              "AUG", "SEP", "OCT", "NOV",
                              "DEC", "DJF", "MAM", "JJA",
                              "SON", "metANN"))
ggplot(temp, aes(YEAR, JJA))+
  geom_line()+
  geom_smooth(fill = "yellow")+
  labs(x = "Year", y = "Mean Summer Temperatures (C)",
       title = "Mean Summer Temperatures in Buffalo, NY",
       subtitle = 
         "Summer includes June, July, and August
       Data from the Global Historical Climate Network 
       Red line is a LOESS smooth")
ggsave("GEO 511 Task 2.png", plot = last_plot())

view(temp)
