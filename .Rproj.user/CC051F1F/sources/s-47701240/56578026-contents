#### Title: Seniority Project - Preliminary Analyses ####

#### Notes: ####
### Descritpion: Use Volden and Wiseman Data to conduct preliminary analyses###

#### Files: ####
### In: code/setup-file.R ###
### Out: NA ###

#### Setup ####
source('code/setup-file.R')

hor <- read.csv('data/volden-renamed-HOR.csv')
hor$totallead <- NA
hor <- hor %>%
  mutate(totallead = ifelse(speaker == 1 | chair == 1 | chair_intell == 1| mem_appropriation == 1 | majLeadership == 1 | minLeadership == 1, 1, 0))


sen <- read.csv('data/volden-renamed-SEN.csv')

#### HOR Preliminary Analyses ####
  # Correlation with term length and leadership positions 

