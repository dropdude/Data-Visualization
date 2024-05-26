# table showing the number of kills for various characters in each season of the 
# TV show "The Walking Dead." The characters listed are 
# Rick, Morgan, Glen, Daryl, Carl, Michonne, Carol, and Maggie, and the table 
# includes the number of kills for each character in seasons 1 through 6. 
# There are some missing values indicated by "NA."
install.packages("ggplot2")
install.packages("reshape")
install.packages("MASS")
library(ggplot2)
library(MASS)
rm(list=ls())

kills <- data.frame(
        Rick = c(36, 23, 59, 36, 36, 66),
        Morgan = c(3, NA, 2, NA, 5, 33),
        Glen = c(4, 10, 22, 29, 73, 44),
        Daryl = c(8, 19, 41, 68, 43, 41),
        Carl = c(0, 17, 18, 17, 8, 2),
        Michonne = c(NA, 1, 29, 46, 35, 42),
        Carol = c(0, 0, 8, 10, 37, 29),
        Maggie = c(NA, 2, 16, 32, 9, 12)
)

#Examine Data
kills

kills$Season = 1:6 #Add season variable
kills 

#____________________1________________________
# uses the reshape2 package to transform the original "kills" data frame from a 
# wide format (where each character's kills are in separate columns) to a long 
# format (where each row represents a character's kills in a specific season)
#Reshape data
require(reshape2)
kills.long = melt(kills, id.vars = "Season", variable.name = "Character", value.name = "nKills")
kills.long
#The purpose of this transformation is to make it easier to perform various 
#analyses and visualizations on the data, as long-format data is often more 
#suitable for these tasks compared to wide-format data.

kills.long = melt(kills, id.vars = "Season", measure.vars = colnames(kills)[1:3],variable.name = "Character", value.name = "nKills")
kills.long


#____________________2________________________
#code uses the ggplot2 package to create a histogram visualization based on the 
#data in the kills.long data frame. 
require(ggplot2)
ggplot(kills.long, aes(x = nKills)) + geom_histogram()

ggplot(kills.long, aes(x = nKills)) +
        geom_histogram(col = "red", fill="blue", binwidth = 10)

ggplot(kills.long, aes(x = nKills)) + 
        geom_histogram(fill = "orange", alpha = 0.25, breaks = seq(5, 85, 13.5))

ggplot(kills.long, aes(x = nKills)) +
        geom_histogram(aes(y=..density..),col = "red", fill = "blue",binwidth = 10)

#____________________3________________________
# to create a more complex visualization by layering multiple geometries (geoms) on a single plot.
#Layering geoms
ggplot(kills.long, aes(x = nKills)) +
        geom_histogram(aes(y=..density..),col = "red", fill = "blue",binwidth = 10)+
        geom_density(col = "red", size = 2)

#adding a vertical dashed line at the median value of the number of kills in the dataset.
medval = median(kills.long$nKills,na.rm = T)
ggplot(kills.long, aes(x = nKills)) +
        geom_histogram(aes(y=..density..),col = "red", fill = "blue",binwidth = 10)+
        geom_density(col = "red", size = 2)+
        geom_vline(xintercept = medval, col = "purple",linetype = "dashed", size = 1.5)

#____________________4________________________
#creating two separate plots using the ggplot2 package to visualize the relationship between the "Season" and "nKills" variables in the kills.long data frame. 
ggplot(kills.long, aes(x = Season, y = nKills)) + geom_line()
ggplot(kills.long, aes(x = Season, y = nKills)) + geom_point()

#____________________5________________________
#using the ggplot2 package to visualize the relationship between "Season" and "nKills" in the kills.long data frame. 
ggplot(kills.long, aes(x = Season, y = nKills)) + geom_line()
ggplot(kills.long, aes(x = Season, y = nKills)) + geom_point()
ggplot(kills.long, aes(x = Season, y = nKills)) + geom_line(aes(group = Character))
ggplot(kills.long, aes(x = Season, y = nKills)) + geom_line(aes(col = Character))
ggplot(kills.long, aes(x = Season, y = nKills)) + geom_line(aes(linetype = Character))

#____________________6________________________
ggplot(kills.long, aes(x = Season, y = nKills)) + geom_line(aes(color = Character))
ggplot(kills.long, aes(x = Season, y = nKills)) + geom_line(color = "green")
ggplot(kills.long, aes(x = Season, y = nKills)) + geom_line(aes(group = Character), col="green")

#____________________7________________________
#adding a new variable "Gender" to the kills.long data frame based on the "Character" variable. 
#creating a plot using ggplot2 that includes both lines and points
#customizing the appearance of the lines and points by grouping and coloring based on "Character" and "Gender." 

kills.long$Gender = ifelse(kills.long$Character %in% c("Rick","Morgan", "Glen", "Daryl", "Carl"),"M","F")

ggplot(kills.long, aes(x = Season, y = nKills)) + 
        geom_line(aes(group = Character, color = Gender)) + 
        geom_point(aes(shape = Character, color = Gender))+
        scale_shape_manual(values=1:8)

ggplot(kills.long, aes(x = Season, y = nKills)) + 
        geom_line(aes(color = Gender)) + 
        geom_point(aes(shape = Character, color = Gender))+
        scale_shape_manual(values=1:8)

ggplot(kills.long, aes(x = Season, y = nKills)) + 
        geom_line(aes(group = Character, color = Gender)) + 
        geom_point(aes(shape = Character, color = Gender),size=4)+
        scale_shape_manual(values=1:8)


# _Example of adding title
ggplot(kills.long, aes(x = nKills)) +
        geom_histogram(col = "red", fill="blue", binwidth = 10)+
        labs(title = "Walking Dead S1-S6",x = "# of Kills", y = "Frequency")

#____________________8________________________
#visualizes the relationship between "Season" and "nKills" from the kills.long data frame. 
ggplot(kills.long, aes(x = Season, y = nKills)) + 
        geom_line(aes(color = Gender, group = Character))

ggplot(kills.long, aes(x = Season, y = nKills)) + 
        geom_line(aes(color = Gender, group = Character))+
        scale_colour_manual(values = c("green","black"))

ggplot(kills.long, aes(x = Season, y = nKills)) + 
        geom_line(aes(color = Gender, group = Character))+
        scale_colour_manual(values = c("green","black"), breaks = c("M","F"))

ggplot(kills.long, aes(x = Season, y = nKills)) + 
        geom_line(aes(color = Gender, group = Character))+
        scale_colour_manual(values = c("green","black"), breaks = c("M","F"),labels = c("Men", "Women"))

#____________________9________________________
ggplot(kills.long, aes(x = Season, y = nKills)) + 
        geom_line(aes(color = Gender, group = Character)) + 
        geom_point(aes(shape = Character, color = Gender))+
        scale_shape_manual(values= c(1,2,5,3,4,16,17,18))+
        scale_colour_manual(values = c("green","black"))

ggplot(kills.long, aes(x = nKills)) + 
        geom_histogram(aes(fill = Gender),col = "yellow", binwidth = 10)

ggplot(kills.long, aes(x = nKills)) + 
        geom_histogram(aes(fill = Gender),col = "yellow", binwidth = 10)+
        scale_fill_manual(values = c("blue","green"))

ggplot(kills.long, aes(x = nKills)) + 
        geom_histogram(aes(fill = Gender),col = "yellow", binwidth = 10,position = "dodge")+
        scale_fill_manual(values = c("blue","green"))

#____________________10________________________
ggplot(kills.long, aes(x = Season, y = nKills)) +
        geom_line(aes(group = Character, color = Gender))+
        scale_x_continuous(limits = c(0.5,7.5),breaks = 1:6, labels = c(1:5,"six"))

ggplot(kills.long, aes(x=Gender,y = nKills)) + geom_boxplot() #+
scale_x_discrete(labels = c("Women","Men"))

#____________________11________________________
#visualizeing the distribution of the "nKills" variable from the kills.long data frame. 
#customizing various aspects of the plot appearance, including axis text and titles
ggplot(kills.long, aes(x = nKills)) + 
        geom_histogram(col = "red", fill="blue", binwidth = 10)+
        theme(axis.text = element_text(size=18, colour = "green", angle = 45),
              axis.title.y = element_text(family = "mono",size = 24)) 

ggplot(kills.long, aes(x = Season, y = nKills)) +
        geom_line(aes(group = Character, color = Gender)) +
        scale_colour_discrete(name = "New Title")+
        theme(legend.position = c(0.15, 0.85))

ggplot(kills.long, aes(x = Season, y = nKills)) +
        geom_line(aes(group = Character, color = Gender)) + 
        theme(axis.title.y=element_blank(),axis.text.y=element_blank(),axis.ticks.y=element_blank())

#____________________12________________________
#creating a grouped column plot with facets using the ggplot2 package
round(range(kills.long$nKills, na.rm = T))

ggplot(kills.long, aes(x=Character, y = nKills)) + geom_col()+
        scale_y_continuous(limits = c(0,75), breaks = c(0,25,50,75))+
        theme(axis.text.x = element_text(angle = 90))+
        facet_wrap(~Season, ncol=2)

