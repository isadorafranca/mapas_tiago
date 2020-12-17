#MAPS tests
library(ggplot2)
library(maps)
library(ggthemes)
library(readr)
library(DT)
library(ggrepel)
library(ggsn)

russia <- read.csv("~/Documents/Maps/russ.csv", sep=";")
datatable(russia, rownames = TRUE,
          options = list(pageLength = 16))

#Plot map
world <- ggplot() +
  borders("world", colour = "gray81", fill = "white") +
  borders("world", regions = "russia", colour = "antiquewhite3", fill = "antiquewhite") +
  borders("world", regions = "ukraine", colour = "antiquewhite3", fill = "antiquewhite") +
  borders("world", regions = "Antarctic", colour = "gray81") +
  borders("world", regions = "brazil", colour = "antiquewhite3", fill = "antiquewhite")
 theme_map() 
map <- world +
  geom_point(aes(x = long, y = lat, size = n ),
             data = russia, 
             colour = "darkblue", alpha = .5) +
  geom_text_repel(data = russia, aes(x = long, y = lat, label = site)) +
  scale_size_continuous(range = c(1, 7), 
                        breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)) +
   theme (legend.position="right", legend.box = "horizontal" ) +
labs(title ='Number of samples per site' , size = 'Number of samples')

plot(map)

