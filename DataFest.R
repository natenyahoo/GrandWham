library(tidyverse)
library(mosaic)

logs <- read_csv("logs.csv",guess_max=2106600)
playerlog <- read_csv("player-6607011.csv")
s5 <- read_csv("S5_scores_cleaned.csv")

# from narrow data to wide data
s5 <- s5 %>% pivot_wider(names_from = weeks, values_from = S5_mean)

# rename columns
s5 <- s5 %>% rename("week0" = "0") 
s5 <- s5 %>% rename("week3" = "3") 
s5 <- s5 %>% rename("week6" = "6") 
s5 <- s5 %>% rename("week12" = "12") 
s5 <- s5 %>% rename("week24" = "24") 

# change data type to numeric
sapply(s5, class)

s5$week0 <- as.numeric(as.character(s5$week0))
s5$week3 <- as.numeric(as.character(s5$week3))
s5$week6 <- as.numeric(as.character(s5$week6))
s5$week12 <- as.numeric(as.character(s5$week12))
s5$week24 <- as.numeric(as.character(s5$week24))

# create column for before vs after difference
s5 <- s5 %>% mutate(before_score = 0)
s5 <- s5 %>% mutate(after_score = 0)

