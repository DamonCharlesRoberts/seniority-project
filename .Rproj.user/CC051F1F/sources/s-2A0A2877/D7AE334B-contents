#### Title: Seniority Project - Individual Descriptives ####

#### Notes: ####
### Descritpion: Use Volden and Wiseman Data for descriptive data ###

#### Files: ####
### In: code/setup-file.R ###
### Out: NA ###

#### Setup ####
here::here()
read.csv('data/volden-renamed-HOR.csv')
read.csv('data/volden-renamed-SEN.csv')


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

indivhoragePlot <- ggplot(agedata, aes(x = age)) +
  geom_density(fill = '#BCAAA4', color = '#3E2723', alpha = 0.8) +
  ggtitle('Distribution of Age in Congress') +
  theme_ipsum()
indivhoragePlot
ggsave('figures/Individiaul-Age-Dist.png')

