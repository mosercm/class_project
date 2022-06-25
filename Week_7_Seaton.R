###############################
# Econ 6290 Research Methods summer 2022
# Dr. Christine Moser
# DJ Seaton
# automating data downloads using APIs 
####################################
# Install Git https://happygitwithr.com/install-git.html
# 
#
#
setwd("C:/Users/blueb/Desktop/Econ 6290/week_7/class_project")
install.packages("fredr")

library(fredr)
library(ggplot2)


fredr_set_key("a1d45b324c190ab8df9ae9400b9c0372")

# these first examples search available data series
    gdp_series<-if (fredr_has_key()) {
      # search for series with text matching "gdp" and return the top 50 most popular
      # series
      fredr_series_search_text(
        search_text = "Gross Domestic Product",
        order_by = "popularity",
        limit = 50
      )
    }
    unr_series<-if (fredr_has_key()) {
      # search for series with text matching "unemployment rate" and return the top 10 most popular
      # series
      fredr_series_search_text(
        search_text = "unemployment rate",
        order_by = "popularity",
        limit = 20
      )
    }
    lfpr_series<-if (fredr_has_key()) {
      # search for series with text matching "participation" and return the top 10 most popular
      # series
      fredr_series_search_text(
        search_text = "participation",
        order_by = "popularity",
        limit = 50
      )
    }
    infl_series<-if (fredr_has_key()) {
      # search for series with text matching "inflation" and return the top 10 most popular
      # series
      fredr_series_search_text(
        search_text = "inflation",
        order_by = "popularity",
        limit = 50
      )
    }

# Once you know what you want, you can request data
    unr<-fredr(
      series_id = "UNRATE",
      observation_start = as.Date("2018-01-01"),
      observation_end = as.Date("2022-01-01")
    )

#For this exercise, download a series of your choice 
# and make a line plot of the series over time.
# when  you have finished your code, push it to the class
# GitHub where you got this.

    median_income<-if (fredr_has_key()) {
      # search for series with text matching "inflation" and return the top 10 most popular
      # series
      fredr_series_search_text(
        search_text = "median income",
        order_by = "popularity",
        limit = 15
      )
    }
    rincome<-fredr(
      series_id = "MEHOINUSA672N",
      observation_start = as.Date("1984-01-01"),
      observation_end = as.Date("2020-01-01")
    )   
    ggplot(rincome, aes(x=date, y=value))+
      geom_line()+
      labs(
        x= "Date",
        y = "Real Median Household Income",
        title = "Real Median Household Income Over Time"
      )
    