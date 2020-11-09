#### Aggregative Look at Committee Leaders and Age/Term Length ####

#### Notes: ####
  ### Description: Script file to subset data into only those who held leadership postion of some kind to look at whether the mean age has increased or decreased for them ###

#### Files: ####
  ### In: Source the setup file ####
  ### Out: NA ###

#### Setup ####
here::here()
source('code/1_setup-file.R')
setup()
volden <- read.csv('data/volden-recoded-HOR.csv')
#### Code ####
volden <- volden %>%
  filter(speaker == 1 | chair == 1 | chair_intell == 1 | majLeadership == 1 | minLeadership == 1) %>%
  mutate(senior = yearCongStart - yearStarrt)
horaggage <- ddply(volden, .(congress), summarize, Seniority = mean(senior))

aggageplot <- ggplot() +
  geom_line(data = horaggage, aes(x = congress, Seniority), color='#000000', size=2, alpha=0.9, linetype=4) +
  theme_tufte() +
  ggtitle("Figure 3. Average Seniority - House") +
  labs(caption = "Damon Roberts | Data sources: Volden and Wiseman Legislative Effectiveness Data - House data from 1973-2018.\nNotes: Data is constrained only to those who hold a subcommittee or committee chair position, a majority or minority leadership position, \nor a seat on the Appropriations committee.\nAverage Seniority is an average calculated from subtracting the current term's first calendar year from the member's first term's first calendar year in Congress.",
       x = "Congress", y = "Avg. Seniority") +
  scale_x_continuous(breaks = round(seq(min(horaggage$congress), max(horaggage$congress), by = 4),1))
aggageplot
ggsave('figures/avg-house-seniority-macro.png')
 