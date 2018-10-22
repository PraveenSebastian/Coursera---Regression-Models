
# GLM ---------------------------------------------------------------------

setwd("C:/Users/praveen/Desktop/DataScience/Regression Models")
if(!file.exists("Week4"))
{
  dir.create("Week4")
}

setwd("C:/Users/praveen/Desktop/DataScience/Regression Models/Week4")

d1 <- format(Sys.Date()+98,'%Y-%b-%d')

d1 <- as.Date(cca)

d2 <- format(Sys.Date()+78,'%Y-%b-%d')

d3 <- format(Sys.Date()-98,'%Y-%b-%d')

d4 <- format(Sys.Date()+78,'%Y-%b-%d')

cca <- data.frame(c(d1,d2))

ccm <- data.frame(c(d3,d4))


























