#### Title: Seniority Project - Merging ####

#### Notes: ####
### Descritpion: Merging datasets for the Seniority Project ###

#### Files: ####
### In:  ###
### Out: NA ###

#### Setup ####
here::here()
source('code/setup-file.R')
setup()
#### Load Original Datasets ####
stewHOR_member <- read_excel('data/stewart-woon/house_members_103-115-2.xlsx')
stewHOR_assign <- read_excel('data/stewart-woon/house_assignments_103-115-3.xls')

stewSEN_member <- read_excel('data/stewart-woon/senators_103-115-2.xls')
stewSEN_assign <- read_excel('data/stewart-woon/senate_assignments_103-115-3.xls')
#### Merge Datasets ####

stewHOR <- left_join(stewHOR_member, stewHOR_assign, by = "ID")
stewSEN <- left_join(stewSEN_member, stewSEN_assign, by = "ID")

write_csv(stewHOR,'data/stewart-woon-merged-HOR.csv')
write_csv(stewSEN, 'data/stewart-woon-merged-SEN.csv')

# !!!!!!!!!!!!!!!!!!!!!!!!!!!! #
##### Bioguide and ICPSR ID Conversion ####

convertData <- read.csv('data/mccrain-id-conversion/bioguide_icpsr_crosswalk.csv')
ageData <- read.csv('data/fivethirtyeight-age/fivethirtyeight-mc-age.csv')

agedata <- left_join(ageData, convertData, by='bioguide')
