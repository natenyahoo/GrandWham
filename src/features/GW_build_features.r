library(data.table)
library(tidyverse)
setwd("~/DataFest2022/GrandWham/Files/data files")
logs <- read.csv("logs.csv")
scores <- read.csv("S5_scores_cleaned.csv")





length((unique(logs$skill_level_know)))
length(unique(scores))

skilltime <- logs %>%
  select(player_id, date, event_time_dbl, skill_level_know, skill_level_me, skill_level_people, skill_level_priority, skill_level_refusal, proportion_complete) %>% 
  na.omit(skill_level_know = FALSE, skill_level_me = FALSE, skill_level_people = FALSE, skill_level_priority = FALSE, skill_level_refusal = FALSE)

skilltime$player_id <- as.character(skilltime$player_id)


p1 <- ggplot(skilltime, aes(x = event_time_dbl, y = skill_level_know, color = player_id)) +
  geom_line() +
  theme(legend.position="none")

p2 <- ggplot(skilltime, aes(x = event_time_dbl, y = skill_level_me, color = player_id)) +
  geom_line() +
  theme(legend.position="none")

p3 <- ggplot(skilltime, aes(x = event_time_dbl, y = skill_level_people, color = player_id)) +
  geom_line() +
  theme(legend.position="none")

p4 <- ggplot(skilltime, aes(x = event_time_dbl, y = skill_level_priority, color = player_id)) +
  geom_line() +
  theme(legend.position="none")

p5 <- ggplot(skilltime, aes(x = event_time_dbl, y = skill_level_refusal, color = player_id)) +
  geom_line() +
  theme(legend.position="none")

library(gridExtra)

grid.arrange(p1, p2, p3, p4, p5, nrow = 2)

scores <- reshape(scores, idvar = "player_id", timevar = "weeks", direction = "wide")

player_id <- skilltime$player_id
event_time_dbl <- skilltime$event_time_dbl
skill_level_mean <- skilltime$skill_level_mean

skilltime <- subset(skilltime, select = -c(player_id, event_time_dbl, date))

skilltime <- skilltime %>%
  mutate(skill_level_mean = rowMeans(skilltime))

skilltime <- cbind(player_id, event_time_dbl, date, skilltime)

skilltime3 <- cbind(skilltime3, skill_level_mean)

p6 <- ggplot(skilltime5, aes(x = days, y = skill_level_mean, color = player_id)) +
  geom_line() +
  theme(legend.position="none")

p6

skilltime4 <- subset(skilltime3, player_id != "6427032")
skilltime4 <- subset(skilltime4, player_id != "6427035")
skilltime4 <- subset(skilltime4, player_id != "6427037")
skilltime4 <- subset(skilltime4, player_id != "6427034")

library(lubridate)

date <- skilltime$date
date <- ymd(date)
days <- yday(date) - 65

skilltime <- cbind(skilltime, days)


completion <- logs %>%
  select(proportion_complete)




print("Hi team!")

