#### Title: Seniority Project - Preliminary Analyses ####

#### Notes: ####
### Descritpion: Use Fivethirtyeight data to calculate average age for each congress###

#### Files: ####
### In: code/setup-file.R ###
### Out: NA ###

#### Setup ####
here::here()
source('code/setup-file.R')

#### Function Execution ####
setup()
age538data <- loadfivethrityeight()
agedata <- age538data %>%
  mutate(Chamber =
    case_when(chamber == 'house' ~ 1,
              chamber == 'senate' ~ 0)
  )
horagedata <- agedata %>%
  filter(Chamber == 1)
senagedata <- agedata %>%
  filter(Chamber == 0)

#### Data manipulation #### 

horaggage <- ddply(horagedata, .(congress), summarize, Age = mean(age))
senaggage <- ddply(senagedata, .(congress), summarize, Age = mean(age))

#### Graphing It ####
annotation <- data.frame(
  x = c(80,80),
  y = c(58,53),
  label = c('Senate','House')
)
aggageplot <- ggplot() +
  geom_line(data = horaggage, aes(x = congress, Age), color='#0052cc', size=2, alpha=0.9, linetype=1) +
  geom_line(data = senaggage, aes(x = congress, Age), color = '#ffcb05', size = 2, alpha=0.9, linetype = 6) +
  theme_ipsum() +
  ggtitle("Average Age") + 
  geom_text(data =annotation, aes(x=x, y=y, label=label),
            color = '#000000',size = 5, frontface='bold')
aggageplot
ggsave('figures/age-over-time.png')
