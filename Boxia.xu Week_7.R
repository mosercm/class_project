
# ##############################
# Econ 6290 Research Methods summer 2022
# Boxia XU
# 
# automating data downloads using APIs 
####################################
# Install Git https://happygitwithr.com/install-git.html
# 
#
#
#install.packages("fredr") only need to install once

library(fredr)
library(ggplot2)
setwd("D:/Github Repos/class_project")

### Get key from https://fredaccount.stlouisfed.org/apikey
### log in my account, find API keys
fredr_set_key("df92a1e4644438367cd6dbe1ca348605")

Government_spending_series<-if (fredr_has_key()) {
  fredr_series_search_text(
    search_text = "Government total expenditures",
    order_by = "popularity",
    limit = 20
  )
}

# Once you know what you want, you can request data
Government_spending<-fredr(
  series_id = "W068RCQ027SBEA",
  observation_start = as.Date("2000-01-01"),
  observation_end = as.Date("2022-01-01")
)
ggplot(Government_spending, aes(x=date, y=value)) +
  geom_line() +
  labs(
    x = "Time",
    y = "Government expenditures",
    title = "Government expenditures over time"
  )


#For this exercise, download a series of your choice 
# and make a line plot of the series over time.
# when  you have finished your code, push it to the class
# GitHub where you got this.


  