#Necessary Packages
install.packages("cowplot")

library(tidyverse)
library(ggplot2)
library(cowplot)

# Load the dataset
data(iris)
df <- iris

# Display the first few rows of the dataset
head(df)

# Summary statistics
summary(df)

# Data cleaning (for demonstration, check for missing values)
sum(is.na(df))

# Histogram of Sepal.Length
histogram_plot <- ggplot(df, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Sepal Length", x = "Sepal Length", y = "Frequency")

# Boxplot of Sepal.Length by Species
boxplot_plot <- ggplot(df, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Sepal Length by Species", x = "Species", y = "Sepal Length")

# Scatterplot of Sepal.Length vs Sepal.Width colored by Species
scatterplot_plot <- ggplot(df, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(title = "Scatterplot of Sepal Length vs Sepal Width", x = "Sepal Length", y = "Sepal Width")

# Arrange plots using cowplot
plot_grid(histogram_plot, boxplot_plot, scatterplot_plot, ncol = 1)

# Save plots to files
ggsave("histogram_plot.png", plot = histogram_plot)
ggsave("boxplot_plot.png", plot = boxplot_plot)
ggsave("scatterplot_plot.png", plot = scatterplot_plot)


