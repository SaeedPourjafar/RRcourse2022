
# install.packages("openxlsx")
library(openxlsx) # For reading xlsx files
library(meta)
library(dplyr)

setwd("C:/Users/Saeed/Documents/GitHub/RRcourse2022/RR_May_19_25")
ex.data <- read.xlsx("data\\metaanalysis_data.xlsx")
View(ex.data)

# Case 1: the effect size has been computed and exists within the dataset
m.gen <- metagen(TE = Mean_girls_play_male,
              seTE = SD_girls_play_male,
              data = ex.data,
              studlab = paste(Study),
              fixed = TRUE,
              random = FALSE)
m.gen

# Case 2: this time the effect size are not computed and are not presented within dataset
# instead the experimental and control group have been used
m.groups <- metacont(n.e = N_girls,
                   mean.e = Mean_girls_play_male,
                   sd.e = SD_girls_play_male,
                   n.c = N_boys,
                   mean.c = Mean_boys_play_male,
                   sd.c = SD_boys_play_male,
                   data = ex.data,
                   studlab = paste(Study),
                   fixed = TRUE,
                   random = TRUE)

m.groups

# Case 3: Metadata by random effect 
m_re <- metagen(TE=Mean_girls_play_male,
                 seTE=SD_girls_play_male,
                 data=ex.data,
                 studlab=paste(Study),
                 fixed = FALSE,
                 random = TRUE)
m_re

# Visualizing with the forest plot
m.gen %>% forest(sortvar = Mean_girls_play_male)

m_re %>% forest(sortvar = Mean_girls_play_male)

# Understanding the effect of variables that drives the results
m.gen %>% metareg(`Neutral.toys`+`Parent.present`)

# Check for publication bias
m.gen %>% funnel()
