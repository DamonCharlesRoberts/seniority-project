#### Title: Seniority Project - Aggregate Descriptives ####

#### Notes: ####
### Descritpion: Use Brookings Demographic Data for descriptive data ###

#### Files: ####
### In: code/setup-file.R ###
### Out: NA ###

#### Sourcing ####
here::here()
source('code/1_setup-file.R')


#### Funciton Execution ####
setup()
brookingsHOR <- loadBrookingshor()
brookingsHOR <- brookingsHOR %>%
  mutate(terms = (MeanTerm)/2)
brookingsSEN <- loadBrookkingssen()
brookingsSEN <- brookingsSEN %>%
  mutate(terms= (MeanYears/6))

#### Graphic Creation ####

horPlot <- ggplot(brookingsHOR, aes(x=Congress,y=MeanTerm)) +
  geom_line( color="#D84315", size=2, alpha=0.9, linetype=2) +
  theme_ipsum() +
  ggtitle("Mean Rep. Term Length (Years) Across Congresses")
horPlot
ggsave('figures/rep-agg-plot.png')
senPlot <- ggplot(brookingsSEN, aes(x=Congress,y=stdmeanyears)) +
  geom_line( color="#1565C0", size=2, alpha=0.9, linetype=2) +
  theme_ipsum() +
  ggtitle("Mean Sen. Term Length (Years) Across Congresses")
senPlot
ggsave('figures/sen-agg-plot.png')

termannotation <- data.frame(
  x = c(115, 85),
  y = c(3.5, 2),
  label = c('House', 'Senate')
)
termtimeplot <- ggplot() +
  geom_line(data = brookingsHOR, aes(x = Congress, y = terms),color="#000000", size=2, alpha=0.9, linetype=1) +
  geom_line(data = brookingsSEN, aes(Congress, y=terms), color="#000000", size=2, alpha=0.9, linetype=2) + 
  theme_tufte() +
  ggtitle("Figure 1. Average MC Term-Length Over Congressional Sessions") +
  geom_text(data = termannotation, aes(x=x,y=y,label=label),
            color = '#000000', size = 5, frontface = 'bold') +
  labs(caption = "Damon Roberts | Data Source: Brookings Institute Vital Statistics on Congress.\nNote: Average Term Length of all members of Congress in that particular congressional session.", "Senate data divided by 3 to account for term length differences of House and Senate",
       y = "Avg. Num of Terms", x = "Congress") +
  scale_x_continuous(breaks = round(seq(min(brookingsHOR$Congress), max(brookingsHOR$Congress), by = 4), 1))
termtimeplot
ggsave('figures/term-time-plot.png')
