rm(list=ls())

options(show.error.messages=T)
#options(warn=-1)
#suppressWarnings(suppressMessages(library("tidyverse")))
if(!require(tidyverse)){suppressWarnings(suppressMessages(install.packages("tidyverse")))}
require(tidyverse)

# setwd("/app/site_stephen/")
setwd("/Users/HughLavery/Documents/site_backend/site_map/")
rawdata <- read.csv("Raw Data.csv", stringsAsFactors = T)
bnflist <- read.csv("BNF List.csv", stringsAsFactors = T)
#View(rawdata)
#View(bnflist)

patientdetails <- unique( rawdata[,c(1, 2, 3, 4, 5)] )
#View(patientdetails)

patientmeds <- unique( rawdata[,c(1, 7)] )
#View(patientmeds)

patientconditions <- merge(patientmeds, bnflist)
#View(patientconditions)

patientprofile <- merge(patientconditions, patientdetails)
#View(patientprofile)

patientprofile2 <- unique( patientprofile[,c(1, 3, 5, 6, 7, 8)] )
#View(patientprofile2)

processeddata <- patientprofile2 %>%
  mutate(ind = 1) %>%
  spread(BNF.Code, ind, fill = 0L)
#View(processeddata)

bnfcodes <- unique( bnflist[,c(1, 2)] )
#View(bnfcodes)
bnfcodelist = t(bnfcodes)
#View(bnfcodelist)

colnames(bnfcodelist) = bnfcodelist[1, ]
#View(bnfcodelist)
allbnfcodes = bnfcodelist[-c(1,2), ]
#View(allbnfcodes)

patientcount = nrow(patientdetails)
bnfpatientlist <- data.frame(allbnfcodes)
#View(bnfpatientlist)
bnfpatientlist[nrow(bnfpatientlist)+patientcount,] <- NA
#bnfpatientlist[is.na(bnfpatientlist)] <- 0
#View(bnfpatientlist)

bnfpatientlist = merge(bnfpatientlist, patientdetails)
bnfpatientlist <- unique(bnfpatientlist)
#View(bnfpatientlist)

processeddata2 = data.frame(processeddata)
#View(processeddata2)

bnfpatientlist$X1.1X <- tryCatch({ifelse(is.na(bnfpatientlist$X1.1X) == TRUE, processeddata2$X1.1X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X1.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X1.2X) == TRUE, processeddata2$X1.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X1.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X1.3X) == TRUE, processeddata2$X1.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X1.4X <- tryCatch({ifelse(is.na(bnfpatientlist$X1.4X) == TRUE, processeddata2$X1.4X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X1.5X <- tryCatch({ifelse(is.na(bnfpatientlist$X1.5X) == TRUE, processeddata2$X1.5X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X1.6X <- tryCatch({ifelse(is.na(bnfpatientlist$X1.6X) == TRUE, processeddata2$X1.6X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X1.7X <- tryCatch({ifelse(is.na(bnfpatientlist$X1.7X) == TRUE, processeddata2$X1.7X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X1.8X <- tryCatch({ifelse(is.na(bnfpatientlist$X1.8X) == TRUE, processeddata2$X1.8X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X1.9X <- tryCatch({ifelse(is.na(bnfpatientlist$X1.9X) == TRUE, processeddata2$X1.9X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X2.1X <- tryCatch({ifelse(is.na(bnfpatientlist$X2.1X) == TRUE, processeddata2$X2.1X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X2.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X2.2X) == TRUE, processeddata2$X2.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X2.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X2.3X) == TRUE, processeddata2$X2.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X2.4X <- tryCatch({ifelse(is.na(bnfpatientlist$X2.4X) == TRUE, processeddata2$X2.4X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X2.5X <- tryCatch({ifelse(is.na(bnfpatientlist$X2.5X) == TRUE, processeddata2$X2.5X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X2.6X <- tryCatch({ifelse(is.na(bnfpatientlist$X2.6X) == TRUE, processeddata2$X2.6X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X2.8X <- tryCatch({ifelse(is.na(bnfpatientlist$X2.8X) == TRUE, processeddata2$X2.8X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X2.9X <- tryCatch({ifelse(is.na(bnfpatientlist$X2.9X) == TRUE, processeddata2$X2.9X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X2.11X <- tryCatch({ifelse(is.na(bnfpatientlist$X2.11X) == TRUE, processeddata2$X2.11X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X2.12X <- tryCatch({ifelse(is.na(bnfpatientlist$X2.12X) == TRUE, processeddata2$X2.12X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X3.1X <- tryCatch({ifelse(is.na(bnfpatientlist$X3.1X) == TRUE, processeddata2$X3.1X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X3.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X3.2X) == TRUE, processeddata2$X3.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X3.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X3.3X) == TRUE, processeddata2$X3.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X3.4X <- tryCatch({ifelse(is.na(bnfpatientlist$X3.4X) == TRUE, processeddata2$X3.4X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X3.7X <- tryCatch({ifelse(is.na(bnfpatientlist$X3.7X) == TRUE, processeddata2$X3.7X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X3.9X <- tryCatch({ifelse(is.na(bnfpatientlist$X3.9X) == TRUE, processeddata2$X3.9X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X4.1X <- tryCatch({ifelse(is.na(bnfpatientlist$X4.1X) == TRUE, processeddata2$X4.1X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X4.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X4.2X) == TRUE, processeddata2$X4.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X4.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X4.3X) == TRUE, processeddata2$X4.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X4.4X <- tryCatch({ifelse(is.na(bnfpatientlist$X4.4X) == TRUE, processeddata2$X4.4X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X4.5X <- tryCatch({ifelse(is.na(bnfpatientlist$X4.5X) == TRUE, processeddata2$X4.5X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X4.6X <- tryCatch({ifelse(is.na(bnfpatientlist$X4.6X) == TRUE, processeddata2$X4.6X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X4.7X <- tryCatch({ifelse(is.na(bnfpatientlist$X4.7X) == TRUE, processeddata2$X4.7X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X4.8X <- tryCatch({ifelse(is.na(bnfpatientlist$X4.8X) == TRUE, processeddata2$X4.8X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X4.9X <- tryCatch({ifelse(is.na(bnfpatientlist$X4.9X) == TRUE, processeddata2$X4.9X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X4.10X <- tryCatch({ifelse(is.na(bnfpatientlist$X4.10X) == TRUE, processeddata2$X4.10X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X4.11X <- tryCatch({ifelse(is.na(bnfpatientlist$X4.11X) == TRUE, processeddata2$X4.11X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X5.1X <- tryCatch({ifelse(is.na(bnfpatientlist$X5.1X) == TRUE, processeddata2$X5.1X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X5.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X5.2X) == TRUE, processeddata2$X5.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X5.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X5.3X) == TRUE, processeddata2$X5.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X5.4X <- tryCatch({ifelse(is.na(bnfpatientlist$X5.4X) == TRUE, processeddata2$X5.4X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X5.5X <- tryCatch({ifelse(is.na(bnfpatientlist$X5.5X) == TRUE, processeddata2$X5.5X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X6.1X <- tryCatch({ifelse(is.na(bnfpatientlist$X6.1X) == TRUE, processeddata2$X6.1X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X6.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X6.2X) == TRUE, processeddata2$X6.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X6.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X6.3X) == TRUE, processeddata2$X6.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X6.4X <- tryCatch({ifelse(is.na(bnfpatientlist$X6.4X) == TRUE, processeddata2$X6.4X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X6.5X <- tryCatch({ifelse(is.na(bnfpatientlist$X6.5X) == TRUE, processeddata2$X6.5X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X6.6X <- tryCatch({ifelse(is.na(bnfpatientlist$X6.6X) == TRUE, processeddata2$X6.6X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X6.7X <- tryCatch({ifelse(is.na(bnfpatientlist$X6.7X) == TRUE, processeddata2$X6.7X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X7.1X <- tryCatch({ifelse(is.na(bnfpatientlist$X7.1X) == TRUE, processeddata2$X7.1X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X7.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X7.2X) == TRUE, processeddata2$X7.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X7.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X7.3X) == TRUE, processeddata2$X7.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X7.4X <- tryCatch({ifelse(is.na(bnfpatientlist$X7.4X) == TRUE, processeddata2$X7.4X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X8.1X <- tryCatch({ifelse(is.na(bnfpatientlist$X8.1X) == TRUE, processeddata2$X8.1X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X8.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X8.2X) == TRUE, processeddata2$X8.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X8.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X8.3X) == TRUE, processeddata2$X8.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X9.1X <- tryCatch({ifelse(is.na(bnfpatientlist$X9.1X) == TRUE, processeddata2$X9.1X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X9.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X9.2X) == TRUE, processeddata2$X9.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X9.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X9.3X) == TRUE, processeddata2$X9.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X9.4X <- tryCatch({ifelse(is.na(bnfpatientlist$X9.4X) == TRUE, processeddata2$X9.4X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X9.5X <- tryCatch({ifelse(is.na(bnfpatientlist$X9.5X) == TRUE, processeddata2$X9.5X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X9.6X <- tryCatch({ifelse(is.na(bnfpatientlist$X9.6X) == TRUE, processeddata2$X9.6X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X9.7X <- tryCatch({ifelse(is.na(bnfpatientlist$X9.7X) == TRUE, processeddata2$X9.7X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X10.1X <- tryCatch({ifelse(is.na(bnfpatientlist$X10.1X) == TRUE, processeddata2$X10.1X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X10.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X10.2X) == TRUE, processeddata2$X10.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X10.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X10.3X) == TRUE, processeddata2$X10.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X11.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X11.3X) == TRUE, processeddata2$X11.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X11.4X <- tryCatch({ifelse(is.na(bnfpatientlist$X11.4X) == TRUE, processeddata2$X11.4X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X11.5X <- tryCatch({ifelse(is.na(bnfpatientlist$X11.5X) == TRUE, processeddata2$X11.5X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X11.6X <- tryCatch({ifelse(is.na(bnfpatientlist$X11.6X) == TRUE, processeddata2$X11.6X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X11.7X <- tryCatch({ifelse(is.na(bnfpatientlist$X11.7X) == TRUE, processeddata2$X11.7X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X11.8X <- tryCatch({ifelse(is.na(bnfpatientlist$X11.8X) == TRUE, processeddata2$X11.8X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X12.1X <- tryCatch({ifelse(is.na(bnfpatientlist$X12.1X) == TRUE, processeddata2$X12.1X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X12.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X12.2X) == TRUE, processeddata2$X12.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X12.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X12.3X) == TRUE, processeddata2$X12.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X13.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X13.2X) == TRUE, processeddata2$X13.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X13.3X <- tryCatch({ifelse(is.na(bnfpatientlist$X13.3X) == TRUE, processeddata2$X13.3X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X13.4X <- tryCatch({ifelse(is.na(bnfpatientlist$X13.4X) == TRUE, processeddata2$X13.4X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X13.5X <- tryCatch({ifelse(is.na(bnfpatientlist$X13.5X) == TRUE, processeddata2$X13.5X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X13.6X <- tryCatch({ifelse(is.na(bnfpatientlist$X13.6X) == TRUE, processeddata2$X13.6X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X13.7X <- tryCatch({ifelse(is.na(bnfpatientlist$X13.7X) == TRUE, processeddata2$X13.7X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X13.8X <- tryCatch({ifelse(is.na(bnfpatientlist$X13.8X) == TRUE, processeddata2$X13.8X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X13.9X <- tryCatch({ifelse(is.na(bnfpatientlist$X13.9X) == TRUE, processeddata2$X13.9X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X13.10X <- tryCatch({ifelse(is.na(bnfpatientlist$X13.10X) == TRUE, processeddata2$X13.10X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X13.11X <- tryCatch({ifelse(is.na(bnfpatientlist$X13.11X) == TRUE, processeddata2$X13.11X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X13.12X <- tryCatch({ifelse(is.na(bnfpatientlist$X13.12X) == TRUE, processeddata2$X13.12X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X14.4X <- tryCatch({ifelse(is.na(bnfpatientlist$X14.4X) == TRUE, processeddata2$X14.4X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X15.1X <- tryCatch({ifelse(is.na(bnfpatientlist$X15.1X) == TRUE, processeddata2$X15.1X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})
bnfpatientlist$X15.2X <- tryCatch({ifelse(is.na(bnfpatientlist$X15.2X) == TRUE, processeddata2$X15.2X[processeddata2$Patient.Number %in% bnfpatientlist$Patient.Number], NA)}, error=function(cond) {return(NA)})

#bnfpatientlist[is.na(bnfpatientlist)] <- 0
#View(bnfpatientlist)

finaldata <- bnfpatientlist[,c(89,90,91,92,93,1:ncol(bnfcodelist))]
#View(finaldata)

# setwd("/app/site_stephen/")
setwd("/Users/HughLavery/Documents/site_backend/site_map/")
write.csv(finaldata, file = "MLData.csv", row.names = F)
MLData <- read.csv("MLData.csv", stringsAsFactors = T)
MLData[is.na(MLData)] <- 0
#View(MLData)

MLData$Sex<- ifelse(MLData$Sex=="M", 1, 0)
#View(MLData)

MLDataTrimmed <- MLData[,c(5, 4, 11, 12, 14, 15, 16, 19, 24)]

names(MLDataTrimmed) <- c("Age", "Sex", "X1.6", "X1.7", "X1.9", "X2.1", "X2.2", "X2.5", "X2.12")

#View(MLDataTrimmed)


########Apply########
#library(randomForest)
if(!require(randomForest)){install.packages("randomForest")}
require(randomForest)

# setwd("/app/site_stephen/")
setwd("/Users/HughLavery/Documents/site_backend/site_map/")
DataFrame <- read.csv("RFTraining.csv", stringsAsFactors = T)


DataFrame$Diabetic.Patient <-as.factor(DataFrame$Diabetic.Patient)
DataFrame$X1.6 <-as.factor(DataFrame$X1.6)
DataFrame$X1.7 <-as.factor(DataFrame$X1.7)
DataFrame$X1.9 <-as.factor(DataFrame$X1.9)
DataFrame$X2.1 <-as.factor(DataFrame$X2.1)
DataFrame$X2.2 <-as.factor(DataFrame$X2.2)
DataFrame$X2.5 <-as.factor(DataFrame$X2.5)
DataFrame$X2.12 <-as.factor(DataFrame$X2.12)
DataFrame$Sex <-as.factor(DataFrame$Sex)
DataFrame$Age <-as.numeric(DataFrame$Age)


#MLDataTrimmed$Diabetic.Patient <-as.factor(MLDataTrimmed$Diabetic.Patient)
MLDataTrimmed$X1.6 <-as.factor(MLDataTrimmed$X1.6)
MLDataTrimmed$X1.7 <-as.factor(MLDataTrimmed$X1.7)
MLDataTrimmed$X1.9 <-as.factor(MLDataTrimmed$X1.9)
MLDataTrimmed$X2.1 <-as.factor(MLDataTrimmed$X2.1)
MLDataTrimmed$X2.2 <-as.factor(MLDataTrimmed$X2.2)
MLDataTrimmed$X2.5 <-as.factor(MLDataTrimmed$X2.5)
MLDataTrimmed$X2.12 <-as.factor(MLDataTrimmed$X2.12)
MLDataTrimmed$Sex <-as.factor(MLDataTrimmed$Sex)
MLDataTrimmed$Age <-as.numeric(MLDataTrimmed$Age)

#levels(MLDataTrimmed$Diabetic.Patient) <- levels(DataFrame$Diabetic.Patient)
levels(MLDataTrimmed$X1.6) <- levels(DataFrame$X1.6)
levels(MLDataTrimmed$X1.7) <- levels(DataFrame$X1.7)
levels(MLDataTrimmed$X1.9) <- levels(DataFrame$X1.9)
levels(MLDataTrimmed$X2.1) <- levels(DataFrame$X2.1)
levels(MLDataTrimmed$X2.2) <- levels(DataFrame$X2.2)
levels(MLDataTrimmed$X2.5) <- levels(DataFrame$X2.5)
levels(MLDataTrimmed$X2.12) <- levels(DataFrame$X2.12)
levels(MLDataTrimmed$Sex) <- levels(DataFrame$Sex)
levels(MLDataTrimmed$Age) <- levels(DataFrame$Age)

rf <- readRDS(file = "modelRandom.rds")
y2 = predict(rf, MLDataTrimmed, type ='class')
y3 = data.frame(y2)
y3$ID <- seq.int(nrow(y3))
names(y3) <- c("Diabetic Status", "ID")
#View(y3)

MLData$ID <- seq.int(nrow(MLData))
#View(MLData)

Final = merge(y3, MLData, by = "ID", all = TRUE)
#View(Final)

FinalResult <- Final[,c(3, 4, 5, 2)]
FinalResult$`Diabetic Status`<- ifelse(FinalResult$`Diabetic Status`==1, "Diabetic", "Not Diabetic")
#View(FinalResult)
names(FinalResult) <- c("Patient Number", "First Name", "Second Name", "Diabetes Status")
write.csv(FinalResult, file = "FinalResults.csv", row.names = FALSE)

