#### Title: Seniority Project - Individual Descriptives ####

#### Notes: ####
### Descritpion: Use Volden and Wiseman Data for descriptive data ###

#### Files: ####
### In: code/setup-file.R ###
### Out: NA ###

#### Setup ####
here::here()
hor <- read.csv('data/volden-renamed-HOR.csv')
sen <- read.csv('data/volden-renamed-SEN.csv')
agedata <- read.csv('data/agedata.csv')
agedata <- agedata %>%
  mutate(
    case_when(chamber == 'house' ~ 1,
              chamber == 'senate' ~ 0)
  )

#### Descriptives ####

indivhorPlot <- ggplot(hor, aes(x = currterms)) +
  geom_density(fill = '#E53935', color = '#B71C1C', alpha = 0.8) +
  ggtitle('Distribution of Terms in HOR') +
  theme_ipsum()
horPlot
ggsave('figures/Individual-Terms-Dist-HOR.png')
indivsenPlot <- ggplot(sen, aes(x = currterms)) +
  geom_density(fill = '#607D8B', color = '#263238', alpha = 0.8) +
  ggtitle('Distribution of Terms in Senate') +
  theme_ipsum()
senPlot
ggsave('figures/Individual-Terms-Dist-SEN.png')

annotation <- data.frame(
  x = c(4,15),
  y = c(0.14, 0.03),
  label = c('House','Senate')
)
termplot <- ggplot() +
  geom_density(data=hor, aes(x = currterms), fill = '#E53935', color = '#B71C1C', alpha = 0.4) +
  geom_density(data=sen, aes(x = currterms), fill = '#607D8B', color = '#263238', alpha = 0.5) +
  ggtitle('Distribution of Term Lengths by Chamber') +
  theme_ipsum() +
  geom_text(data = annotation, aes(x=x,y=y,label=label),
            color="#000000", size = 4, frontface = 'bold')
ggsave('figures/terms-by-chamber.png')

ageplot <- agedata %>%
  ggplot(aes(x = age, group=chamber, fill=chamber)) +
  geom_density(adjust=1.5, alpha=.4) +
  theme_minimal() +
  scale_fill_manual(values = c('#FFC107','#37474F')) +
  ggtitle('Distribution of Age in Congress')
ageplot
ggsave('figures/Individual-Age-Dist.png')


###### Those with Positions ####
posplot <- ggplot() +
  geom_density(data =hor, aes(x = totallead), fill = '#607D8B', color = '#263238', alpha =0.8) +
  geom_density(data =sen, aes(x = totallead), fill = '#e53935', color = '#B71c1c', alpha =0.8) +
  theme_ipsum() +
  ggtitle('Distribution of Positions')
posplot

