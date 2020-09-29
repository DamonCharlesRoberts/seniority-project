#### Title: Seniority Project - Aggregate Descriptives ####

#### Notes: ####
### Descritpion: Use Brookings Demographic Data for descriptive data ###

#### Files: ####
### In: code/setup-file.R ###
### Out: NA ###

#### Sourcing ####
here::here()
source('code/setup-file.R')


#### Funciton Execution ####
setup()
brookingsHOR <- loadBrookingshor()
brookingsSEN <- loadBrookkingssen()

#### Graphic Creation ####

horPlot <- ggplot(brookingsHOR, aes(x=Congress,y=MeanTerm)) +
  geom_line( color="#D84315", size=2, alpha=0.9, linetype=2) +
  theme_ipsum() +
  ggtitle("Mean Rep. Term Length (Years) Across Congresses")
horPlot
ggsave('figures/rep-agg-plot.png')
senPlot <- ggplot(brookingsSEN, aes(x=Congress,y=MeanYears)) +
  geom_line( color="#1565C0", size=2, alpha=0.9, linetype=2) +
  theme_ipsum() +
  ggtitle("Mean Sen. Term Length (Years) Across Congresses")
senPlot
ggsave('figures/sen-agg-plot.png')


