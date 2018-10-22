
# Introduction ------------------------------------------------------------

setwd("C:/Users/praveen/Desktop/DataScience/Regression Models/Week1")
install.packages('usingR')
library(usingR)
data(Galton)
library(reshape)
long <- melt(Galton)
library(ggplot2)
g <- ggplot2(long, aes(x = value, fill = variable))
g <- g + geom_histogram(colour = "black", binwidth = 1)
g <- g + facet_grid(.~ variable)
install.packages("manipulate")
library(manipulate)

x <- Galton$parent - mean(Galton$parent)
y <- Galton$child - mean(Galton$child)
freqData <- as.data.frame(table(x,y))
names(freqData)  <- c ("child","parent","freq")
freqData$child <- as.numeric(as.character(freqData$child))
freqData$parent <- as.numeric(as.character(freqData$parent))
myPlot <- function(beta) {
  
g <- ggplot2(filter(freqData, freq > 0), aes(x = parent, y = child))
  
  
}








