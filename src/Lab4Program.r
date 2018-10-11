# Name:Zach Leonardo
# Date: Oct. 10 2018

# Run the below only if the library is not already installed.
# install.packages(dslabs)

library(dslabs)
library(dplyr)
library(tidyverse)
data(us_contagious_diseases)

#Question 1.
dat <- us_contagious_diseases %>% filter(disease == "Measles")
dat <- dat %>% filter(state != "Alaska")
dat <- dat %>% filter(state != "Hawaii")
dat <- dat %>% mutate(Per100000rate = ((count*100000)/population)*(weeks_reporting/52))
View(dat)

#Question 2.
dat <- dat %>% filter(state == "California")
ggplot(data = dat) + geom_line(mapping = aes(x = year, y = Per100000rate)) + geom_vline(xintercept = 1965)

#Question 3.
dat_caliFocus <- filter(us_contagious_diseases, state == "California")
dat_caliFocus$yearBlock[dat_caliFocus$year == 1950] <- "1950’s"
dat_caliFocus$yearBlock[dat_caliFocus$year == 1960] <- "1960’s"
dat_caliFocus$yearBlock[dat_caliFocus$year == 1970] <- "1970’s"
ggplot(data = dat_caliFocus ) + geom_bar(mapping = aes(x = state, y = sqrt(count), fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
#OR:
ggplot(data = dat_caliFocus ) + geom_bar(mapping = aes(x = state, y = count, fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
  The plot with the square root of the count has more variability since the bars are bigger and more spaced out.

#Question 4.
dat <- us_contagious_diseases
dat$yearBlock[dat$year == 1950] <- "1950’s"
dat$yearBlock[dat$year == 1960] <- "1960’s"
dat$yearBlock[dat$year == 1970] <- "1970’s"
ggplot(data = dat ) + geom_bar(mapping = aes(x = state, y = count, fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
  Just like the previous plot, the 1960's year block has the highest amount of contagious diseases.

#Question 5.
ggplot(data = dat ) + geom_tile(mapping = aes(x = state, y = count, color = Per100000rate), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
  This plot is still very hard to read but now the colors represent the disease rate instead of year blocks

#Question 6.
ggplot(data = asd) + geom_line(mapping = aes(x = year, y = asdrate)) + geom_vline(xintercept = 1965)
  Using the yearly rate for Autism Spectrum Disorder in the US, provided by the WHO, I have concluded that
that there is no increase in the autism rate after vaccines were introduced in 1965.
