#### Title: Seniority Project - Preliminary Analyses ####

#### Notes: ####
### Descritpion: Use Volden and Wiseman Data to conduct preliminary analyses###

#### Files: ####
### In: code/setup-file.R ###
### Out: NA ###

#### Setup ####
here::here()
source('code/1_setup-file.R')
setup()
#hor <- read.csv('data/volden-renamed-HOR.csv')
#hor$totallead <- NA
#hor <- hor %>%
#  mutate(totallead = ifelse(speaker == 1 | chair == 1 | chair_intell == 1| mem_appropriation == 1 | majLeadership == 1 | minLeadership == 1, 1, 0))
#write.csv(hor,'data/volden-recoded-HOR.csv')

#sen <- read.csv('data/volden-renamed-SEN.csv')
#sen <- sen %>%
  #mutate(totallead = ifelse(chair == 1 | subchair == 1 | majLeader == 1 | minLeader == 1, 1, 0))
#write.csv(sen, 'data/volden-recoded-SEN.csv')

#### HOR Preliminary Analyses ####
  # Correlation with term length and leadership positions 
hor <- read.csv('data/volden-recoded-HOR.csv')
sen <- read.csv('data/volden-recoded-SEN.csv')

ols.hor.1 <- lm(totallead ~ currterms + dem + female + legeffective + percent_vote, data = hor)
ols.hor.1
stargazer::stargazer(ols.hor.1, type = 'text')

fe.hor.1 <- plm(totallead ~ currterms + dem + female + legeffective + percent_vote, data = hor, index = c('congress'), model = 'within')

ols.sen.1 <- lm(totallead ~ currterms + dem + female + legeffictive + percent_vote, data = sen)
stargazer::stargazer(ols.sen.1, type = 'text')

fe.sen.1 <- plm(totallead ~ currterms + dem + female + legeffictive + percent_vote, data = sen, index = c('congress'), model = 'within')
stargazer::stargazer(fe.sen.1, type = 'text')

table1 <- stargazer::stargazer(fe.hor.1, fe.sen.1, type = 'html', title = 'Fixed Effects of Term Lengths on Leadership', out = 'figures/table1.html')
