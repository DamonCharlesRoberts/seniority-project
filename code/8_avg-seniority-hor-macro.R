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
volden <- read.csv('data/volden-recoded-HOR.csv') %>%
  mutate(senior = yearCongStart - yearStarrt)
#### Code ####
voldenf <- volden %>%
  filter(speaker == 1 | chair == 1 | chair_intell == 1 | majLeadership == 1 | minLeadership == 1) %>%
  mutate(senior = yearCongStart - yearStarrt)
voldenR <- volden %>%
  filter(dem == 0)
voldenD <- volden %>%
  filter(dem == 1)
voldenfR <- voldenf %>%
  filter(dem == 0)
voldenfD <- voldenf %>%
  filter(dem==1)
allseniorityR <- voldenR %>%
  ddply(.(congress),summarize,allseniority = mean(senior))
allseniorityD <- voldenD %>%
  ddply(.(congress),summarize,allseniority = mean(senior))
horaggageR <- ddply(voldenfR, .(congress), summarize, Seniority = mean(senior))
horaggageRm <- left_join(horaggageR, allseniorityR, by="congress")  %>%
  mutate(stdseniority = (Seniority/allseniority))
horaggageD <- ddply(voldenfD, .(congress), summarize, Seniority = mean(senior))
horaggageDm <- left_join(horaggageD, allseniorityD, by="congress") %>%
  mutate(stdseniority = (Seniority/allseniority))

annotatestdsenior <- 
  data.frame(
    x = c(95,94),
    y = c(2.3,1.4),
    label = c('Republican','Democrat')
  )
aggageplot <- ggplot() +
  geom_line(data = horaggageRm, aes(x = congress, y = stdseniority), color='#000000', size=2, alpha=0.9, linetype=1) +
  geom_line(data = horaggageDm, aes(x = congress, y = stdseniority), color='#000000',size=2, alpha=0.9, linetype=2) +
  theme_tufte() +
  ggtitle("Figure 3. Average Seniority by Party- House") +
  labs(caption = "Damon Roberts | Data sources: Volden and Wiseman Legislative Effectiveness Data - House data from 1973-2018.\nNotes: Data is constrained only to those who hold a subcommittee or committee chair position, a majority or minority leadership position, \nor a seat on the Appropriations committee.\nAverage Seniority is an average calculated from subtracting the current term's first calendar year from the member's first term's first calendar year in Congress \nthen standardized from the avg. seniority of all copartisan colleagues.", 
       x = "Congress", y = "Avg. Seniority") +
  scale_x_continuous(breaks = round(seq(min(horaggage$congress), max(horaggage$congress), by = 4),1)) + 
  geom_text(data =annotatestdsenior, aes(x=x, y=y, label=label),
            color = '#000000',size = 5, frontface='bold')
aggageplot
ggsave('figures/avg-house-seniority-macro.png')
 