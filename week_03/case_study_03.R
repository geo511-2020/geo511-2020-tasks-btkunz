library(gapminder)
library(ggplot2)
library(dplyr)

gapminder_wealth <- gapminder %>%
  filter(country != "Kuwait")
 
#Create plot 1
plot1 <- ggplot(data = gapminder_wealth, aes(x = lifeExp, y = gdpPercap, color = continent, size = pop/100000))+
  geom_point()+
  facet_wrap(~year,nrow=1)+
  scale_y_continuous(trans = "sqrt")+
  theme_bw()+
  labs(size = "Population", title = "Life Expectancy Through Time")

print(plot1)

#Create Plot 2
gapminder_continent <- gapminder %>%
group_by(continent, year)%>%
summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop), pop = sum(as.numeric(pop)))

plot2 <- ggplot(data = gapminder_continent, aes(x = year, y = gdpPercapweighted))+
  geom_line() + 
  geom_point(aes(size = pop/100000)) + 
  geom_line(data = gapminder_wealth, aes(x = year, y = gdpPercap, color = "black", group = country)) + 
  geom_point(data = gapminder_wealth, aes(x = year, y = gdpPercap, color = "black", size = pop/100000)) + 
  facet_wrap(~continent,nrow=1) + 
  theme_bw()+
  labs(title = "Wealth Through Time")

print(plot2)

ggsave("case_study_03.png", plot = last_plot())