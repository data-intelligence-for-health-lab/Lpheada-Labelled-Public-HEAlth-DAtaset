
library(tidyverse)
library(reticulate)
library(ggthemes)
library(kableExtra)
library(tidyverse)
library(googlesheets4)
library(tidymodels)
library(gghighlight)
library(hrbrthemes)
library(ggthemes)
library(ggrepel)
library(ggalt)
library(extrafont)
library(ggtext)
library(ggforce)
library(cowplot)



setwd("Path to your Dataset")

theme_set(theme_tufte())
theme_update(legend.position = 'none',
             text = element_text(family = 'Lobser'),
             plot.title = element_text(margin = margin(t= 10,b= 5),family = 'Lobser'),
             plot.subtitle = element_text(margin = margin(b= 10),family = 'Lobser'),
             panel.background = element_rect(fill = '#FDF6E3'),
             plot.background = element_rect(fill = '#FDF6E3'))


countries <- c('Canada','Australia', 'United states', 'United Kingdom')


#the order of the scores on the radar plot
order <- c( 'g', 'ar','f', 'c', 'l', 'd',  'gs','t','sc')

viz_scaled <- viz %>%
  mutate_at(order, scales::rescale, to = c(3, 20)) %>%
  filter(country %in% countries) %>%
  # filter(!is.na()) %>%
  mutate(country = factor(country))  %>%
  pivot_longer(
    names_to = 'metric',
    cols = c( 'g', 'ar','f', 'c', 'l', 'd', 'gs', 't', 'sc'),
    values_to = 'value') 


library(showtext)
font_add("Arial", "/System/Library/Fonts/Supplemental/Arial.ttf")  # Use the actual file path
showtext_auto()

#Normalize the scores 
viz_scaled= viz_scaled[complete.cases(viz_scaled), ]




#The core plot snippet
ggplot() +
  ### This plots the average of each score
  geom_polygon(
    data = viz_scaled %>%  group_by(country, metric) %>%
      filter(!is.na(metric)) %>%
      filter(!is.na(value)) %>%
      summarise_at(c("value"),mean) %>%
      arrange(factor(metric, levels = order)) %>%
      ungroup(),
    aes(x = metric, y = value, group = country,),
    alpha = .35,
    size = .5,
    show.legend = T,
    fill = "#b51038" 
  ) +
  ### This plots the maximum of each score
  geom_polygon(
    data = viz_scaled %>%  group_by(country, metric) %>%
      summarise_at(c("value"), max) %>%
      arrange(factor(metric, levels = order)) %>%
      ungroup(),
    aes(x = metric, y = value, group = country,),
    alpha = .15,
    size = .5,
    show.legend = T,
    fill = "#b51038"
  ) +
  ### This plots the minimumn of each score
  
  geom_polygon(
    data = viz_scaled %>%  group_by(country, metric) %>%
      summarise_at(c("value"), min) %>%
      arrange(factor(metric, levels = order)) %>%
      ungroup(),
    aes(x = metric, y = value, group = country,),
    alpha = 1,
    size = .5,
    show.legend = T,
    fill =  "#b51038"
    #"#b51038"
  ) +
  scale_x_discrete(
    limits = order,
    labels = c(
      ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' #I removed the labels, feel free to add them again
    )
  ) +
  coord_polar(clip = 'off') +
  theme_minimal() +
  labs(title = "Lexical and Linguistic characteristics of tweets per country",
       caption = 'Source: Spotify \n Visualization: mcnakhaee') +
  ylim(0, 20.5) + #This mainly scales the shape of the inner radar charts.
  facet_wrap( ~ country, ncol = 4) +
  theme(
    axis.title = element_blank(),
    axis.ticks = element_blank(),
    axis.text.y = element_blank(),
    axis.text.x = element_text(
      family =  'Montserrat',
      size = 8.5,
      margin = ggplot2::margin(30, 0, 20, 0)
    ),
    plot.caption = element_text(
      family = 'Montserrat',
      margin = ggplot2::margin(30, 0, 20, 0),
      size = 11,
      color = 'grey80'
    ) ,
    text = element_text(family =  'Montserrat'),
    strip.text = element_text(family =  'Montserrat', size = 18),
    strip.text.x = element_text(margin = ggplot2::margin(1, 1, 1, 1, "cm")),
    panel.spacing = unit(3.5, "lines"),
    panel.grid = element_blank(),
    plot.title = element_text(
      family = 'Montserrat',
      hjust = .5,
      margin = ggplot2::margin(30, 0, 20, 0),
      size = 32,
      color = 'gray10'
    )
  )
ggsave("output_viz.pdf", width=15)

