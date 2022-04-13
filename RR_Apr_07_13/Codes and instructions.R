# RMarkdown #2 
# Reproducible Research 2022
# Wojciech Hardy & Lukasz Nawaro

setwd("C:/Users/Saeed/Documents/GitHub/RRcourse2022/RR_Apr_07_13")

# We need to load the necessary packages if we're operating through an R script.

library(rmarkdown)

# We can render an .Rmd document by using the render() function

# render("RMD_class_1_cut.Rmd")

# Running the code below will create 8 reports in pdf 
for (data in c('season_1.RDATA','season_2.RDATA',
               'season_3.RDATA','season_4.RDATA',
               'season_5.RDATA','season_6.RDATA',
               'season_7.RDATA','season_8.RDATA')) {
  rmarkdown::render("Assignment_3_DONE.Rmd", 
                    output_file = paste0('Season ',substr(data,8,8),'_report','.pdf'),
                    params = list(data = data))
}

# The render function can overwrite the document settings

# render("RMD_class_1_cut.Rmd", output_format = "pdf_document")   # switches the output format

# render("RMD_class_1_cut.Rmd", clean = FALSE)   # tells knitr to keep the intermediate files (e.g. ".md")

# See https://www.rdocumentation.org/packages/rmarkdown/versions/2.6/topics/render for more


#################


# Assignment 3
# 
# Open the Assignment 3.Rmd file (and the .html for reference). Take a look.
# 
# Main goal: modify the Assignment 3 content to make it an automated report
# that can be used for any of the Game of Thrones seasons.
# 
# - Use params. (DONE, the param name is 'data')
# 
# - You can refer to the files in the Data folder as input or you can visit
# the Wikipedia pages for specific seasons and use web scraping (the longer but possible road). (DONE)
# 
# - Change the relevant numbers, names, descriptions, etc. in the text so that
# the report includes info for the correct season (DONE)
# 
# - If you get that far, do a loop with render() to quickly create 8 reports in pdfs. (DONE)

