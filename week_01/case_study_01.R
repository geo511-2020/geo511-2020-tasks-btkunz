library (ggplot2)
data(iris)
str(iris)
ggplot(iris, aes(Petal.Length, color = "yellow")) +
  geom_histogram(fill = "yellow", alpha = 0.4) +
  labs(x = "Petal Length", y = "Count")
petal_length_mean <- mean(iris$Petal.Length)
print(petal_length_mean)
