library(ggplot2)
library(dplyr)
spotify<-read.csv("spotify-2023.csv")
summary(spotify)
str(spotify)

require(ggplot2)

# Task 1: Bar Chart
# Create a bar chart showing the distribution of different species in the "iris" dataset
# Create a histogram of genre distribution
# Count the number of songs released in each month


# Create a histogram to visualize the distribution of song releases by month
filter(spotify, released_year == "2023")


# Convert the table to a data frame
songs_per_month <- as.data.frame(songs_per_month)
names(songs_per_month) <- c("Month", "Frequency")

# Create a histogram to visualize the distribution of song releases by month
ggplot(songs_per_month, aes(x = Month, y = Frequency)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  scale_x_continuous(breaks = 1:12, labels = month.abb) +  # Set x-axis labels from 1 to 12 using month abbreviations
  labs(title = "Number of Songs Released in 2023 by Month",
       x = "Month",
       y = "Frequency of Songs Released")
# Task 2: Line Chart
# Create a line chart displaying the relationship between sepal length and sepal width, using different colors for each species
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_line() +
  labs(title = "Relationship between Sepal Length and Width", x = "Sepal Length", y = "Sepal Width")

# Task 3: Density Plot
# Create a scatter plot showing the relationship between sepal length and sepal width, with colors indicating different species
# Create a density plot of danceability
ggplot(spotify, aes(x = bpm, y = danceability_.)) +
  geom_point(shape = 16, size = 2, alpha = 0.6, color = "skyblue") +
  geom_smooth(method = "loess", color = "darkred", se = FALSE) +  # Add a trend lined
  labs(title = "Danceability by BPM",
       x = "Beats Per Minute (BPM)",
       y = "Danceability") 



# Task 4: Bar Graph
# Create a Bar Graph to visualize the distribution of petal length for each species
high_danceability<-filter(danceability_. >= 70)

# Count the number of songs for each year
songs_per_year <- count(high_danceability, released_year)

# Create a bar plot of songs with danceability at least 70% from each year
ggplot(songs_per_year, aes(x = released_year, y = n)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Number of Songs with Danceability at least 70% by Year",
       x = "Year",
       y = "Number of Songs")
#Used Freedman-Diaconis Rule to determine binwith =  (2 * IQR) / (length(iris$Petal.Length)^(1/3))

# Task 5: Box Plot
# Create a box plot showcasing the distribution of sepal lengths for each species
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Distribution of Sepal Length by Species", x = "Species", y = "Sepal Length")
