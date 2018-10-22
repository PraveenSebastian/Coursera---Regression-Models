
# modelSelection ----------------------------------------------------------

setwd("C:/Users/praveen/Desktop/DataScience/Regression Models")
getwd()
if(!file.exists("Week3"))
{
  dir.create("Week3")
}
setwd("C:/Users/praveen/Desktop/DataScience/Regression Models/Week3")
n <- 100
nosim <- 1000
#x2 and x3 depending much on x1
x1 <- rnorm(n); x2 <- rnorm(n); x3 <- rnorm(n);
betas <- sapply(1 : nosim, function(i)
{
  y <- x1 + rnorm(n, sd = 0.3)
  c(coef(lm(y ~ x1))[2],
  coef(lm(y ~ x1 + x2))[2],
  coef(lm(y ~ x1 + x2 + x3))[2])
})
round(apply(betas, 1, sd), 5)
#x2 and x3 heavily depending on x1
x1 <- rnorm(n); x2 <- x1/sqrt(2) + rnorm(n)/sqrt(2); x3 <- x1 * 0.95 + rnorm(n)*sqrt(1-0.95^2);
betas <- sapply(1 : nosim, function(i)
{
  y <- x1 + rnorm(n, sd = 0.3)
  c(coef(lm(y ~ x1))[2],
    coef(lm(y ~ x1 + x2))[2],
    coef(lm(y ~ x1 + x2 + x3))[2])
})
round(apply(betas, 1, sd), 5)


