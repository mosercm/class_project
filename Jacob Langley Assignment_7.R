##Jacob Langley Assignment 7

install.packages("fredr")

library(ggplot2)
library(fredr)

fredr_set_key("5ebd5f8e5eb6afaec025906f46367571")


unr_series<-if (fredr_has_key()) {
  fredr_series_search_text(
    search_text = "unemployment rate",
    order_by = "popularity",
    limit = 20
  )
}

Recession_Indicator<-fredr(
  series_id = "SAHMREALTIME",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)


ggplot(data=Recession_Indicator, aes(x=date, y=value, group=1)) +
  geom_line(color="red")+
  geom_point() +
  labs(
    x = "Time",
    y = "Recession Indicator Value",
    title = "Real-time Sahm Rule Recession Indicator"
  )
