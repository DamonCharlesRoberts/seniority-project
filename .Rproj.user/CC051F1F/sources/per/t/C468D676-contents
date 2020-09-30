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

termannotation <- data.frame(
  x = c(115, 85),
  y = c(6.5, 11.5),
  label = c('House', 'Senate')
)
termtimeplot <- ggplot() +
  geom_line(data = brookingsHOR, aes(x = Congress, y = MeanTerm),color="#D84315", size=2, alpha=0.9, linetype=1) +
  geom_line(data = brookingsSEN, aes(Congress, y=MeanYears), color="#1565C0", size=2, alpha=0.9, linetype=2) + 
  theme_ipsum() +
  ggtitle("Mean MC Term-Length Over Time") +
  geom_text(data = termannotation, aes(x=x,y=y,label=label),
            color = '#000000', size = 5, frontface = 'bold')
termtimeplot
ggsave('figures/term-time-plot.png')
