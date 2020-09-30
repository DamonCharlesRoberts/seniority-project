#### Title: Seniority Project - Individual Dataset Variable Renaming ####

#### Notes: ####
### Descritpion: Use Volden and Wiseman Data to rename variables ###

#### Files: ####
### In: code/setup-file.R ###
### Out: NA ###

#### Source ####
here::here()
source('code/setup-file.R')

#### Function Execution ####
hor <- loadvoldenhor()
sen <- loadvoldensen()

#### Rename Variables ####
hor <- hor %>%
  rename(ID = `ICPSR number, according to Poole and Rosenthal`) %>%
  rename(congress = `Congress number`) %>%
  rename(yearCongStart = `Year at start of Congress`) %>%
  rename(dem = `1 = Democrat`) %>%
  rename(yearStart = `Year first elected to House`) %>%
  rename(female = `1 = female`) %>%
  rename(percent_vote = `Percent vote received to enter this Congress`) %>%
  rename(speaker = `1= Speaker`) %>%
  rename(chair = `1 = Chair of subcommittee, according to Almanac of American Politics and Adler/W`) %>%
  rename(Black = `1 = African American`) %>%
  rename(latinx = `1 = Latino/a`) %>%
  rename(mem_appropriation = `1 = Member of Appropriation, Rules, or Ways and Means`) %>%
  rename(chair_intell = `1 = Chair, of standing committee or intellgence/homeland sec according to Stewar`) %>%
  rename(stateLeg = `1 = served in state legislature`) %>%
  rename(stateLegProf = `state_leg * state legislature professionalism`) %>%
  rename(majority = `1 = majority party member`) %>%
  rename(majLeadership = `1 = Majority party leadership`) %>%
  rename(minLeadership = `1 = Minority party leadership`) %>%
  rename(totalSponsored = `Total bills sponsored`) %>%
  rename(totalHouse = `Total bills passed House`) %>%
  rename(totalLaw = `Total bills became law`) %>%
  rename(legeffective = `Legislative Effectiveness Score (1-5-10)`) %>%
  rename(currterms = `Seniority, number of terms served counting current`)

sen <- sen %>%
  rename(congress = `congress number`) %>%
  rename(ID = `icpsr number`) %>%
  rename(yearcongStart = `year elected for congress`) %>%
  rename(dem = `1 if senator is democrat`) %>%
  rename(majority = `1 if senator is in majority party`) %>%
  rename(yearStart = `year first elected to the senate`) %>%
  rename(female = `1 if senator is female`) %>%
  rename(Black = `1 if senator is african american`) %>%
  rename(latinx = `1 if senator is latino`) %>%
  rename(percent_vote =`vote share in last election`) %>%
  rename(chair = `1 if senator is a committee chair`) %>%
  rename(subchair = `1 if senator is a subcommittee chair`) %>%
  rename(currterms = `seniority`) %>%
  rename(stateLeg = `1 if senator ever served in state legislature`) %>%
  rename(majLeader = `1 if senator is majority party leader`) %>%
  rename(minLeader = `1 if senator is minority party leader`) %>%
  rename(totalSponsored = `Total number of bills sponsored by this senator`) %>%
  rename(totalSenate = `Total number of bills passing Senate`) %>%
  rename(totalLaw = `Total number of bills becoming law`) %>%
  rename(legeffictive = `legislative effectiveness score`) %>%
  rename(powrcmte = `1 if sit on power committee`) %>%
  rename(freshman = `1 if freshman senator`)

#### Save Renamed Data ####
write.csv(hor, 'data/volden-renamed-HOR.csv')
write.csv(sen, 'data/volden-renamed-SEN.csv')
