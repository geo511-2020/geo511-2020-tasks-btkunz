library(tidyverse)
library(nycflights13)


#arrange flights by farthest from NYC
flights2 <- arrange(flights, desc(distance))%>%
#Join airports and flights tables
  left_join(airports, c("dest" = "faa"))

#List name of the farthest airport
ans <- select(flights2, name)
print(ans[1,])