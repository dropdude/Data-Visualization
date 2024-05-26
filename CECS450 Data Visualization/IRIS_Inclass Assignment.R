# Load libraries
install.packages("ggplot2")
library(ggplot2)
library(datasets)
data(iris)
summary(iris)
require(ggplot2)
# Task 1: Bar Chart
# Create a bar chart showing the distribution of different species in the "iris" dataset

ggplot(iris, aes(x = Species)) + 
  geom_bar(fill = "green", color = "black") +
  labs(title = "Iris Species Distribution", x = "Species", y = "Count")

# Task 2: Line Chart
# Create a line chart displaying the relationship between sepal length and sepal width, using different colors for each species
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_line() +
  labs(title = "Relationship between Sepal Length and Width", x = "Sepal Length", y = "Sepal Width")

# Task 3: Scatter Plot
# Create a scatter plot showing the relationship between sepal length and sepal width, with colors indicating different species
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  labs(title = "Relationship between Sepal Length and Width", x = "Sepal Length", y = "Sepal Width")


# Task 4: Histogram
# Create a histogram to visualize the distribution of petal length for each species
ggplot(iris, aes(x = Petal.Length, fill = Species)) +
  geom_histogram(binwidth = 0.5, position = "dodge") +
  labs(title = "Distribution of Petal Length by Species", x = "Petal Length", y = "Count")
#Used Freedman-Diaconis Rule to determine binwith =  (2 * IQR) / (length(iris$Petal.Length)^(1/3))

# Task 5: Box Plot
# Create a box plot showcasing the distribution of sepal lengths for each species
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Distribution of Sepal Length by Species", x = "Species", y = "Sepal Length")


# Observations

# The bar graph gave the information that we have 50 data of each iris species as info.
#Setosa is unique in its ratio from sepal length vs width ratio the other 2 are similar.
#Setosa is by enlarge petal length of 1 while versicolor and virginca vary more but, the create a bell curve.
#Finally with a box plot we can see that sepal length the are clearly generally distinct and could be a good way to figure out the 
#difference among the species through sepal length.
