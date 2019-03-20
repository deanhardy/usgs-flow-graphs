rm(list=ls())

library(ggplot2)
library(tidyverse)
library(lubridate)
library(dataRetrieval)

## code based on USGS presentation online here:
## https://owi.usgs.gov/R/dataRetrieval.html#1

siteNumber <- "02347500" ##
pCode <- c('00065', '00060') ## list available here: 
startDate <- "2018-03-14"
endDate <- "2019-03-14"

dat <- readNWISuv(siteNumbers = siteNumber,
                     parameterCd = pCode,
                     startDate = startDate,
                     endDate = endDate)

dat <- renameNWISColumns(dat)

parameterInfo <- attr(dat, "variableInfo")
siteInfo <- attr(dat, "siteInfo")

ts <- ggplot(data = dat,
             aes(dateTime, GH_Inst)) +
  geom_line() + 
  xlab("") +
  ylab(parameterInfo$parameter_desc) +
  ggtitle(siteInfo$station_nm)
ts
