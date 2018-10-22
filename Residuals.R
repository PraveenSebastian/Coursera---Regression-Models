
# Residuals ---------------------------------------------------------------

setwd("C:/Users/praveen/Desktop/DataScience/Regression Models/Week2")
ynew <- predict(lm(y ~ x))
data(anscombe)
example(anscombe)
