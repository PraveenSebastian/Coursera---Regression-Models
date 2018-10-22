
# Course Project ----------------------------------------------------------


# Take the mtcars data set and write up an analysis to answer the below two questions using regression models and exploratory data analyses.

# (1) Is an automatic or manual transmission better for MPG

# (2) Quantify the MPG difference between automatic and manual transmissions


setwd("C:/Users/praveen/Desktop/DataScience/Regression Models")

if(!file.exists("Project"))
{
  dir.create("Project")
}

# Qn 1. Is an automatic or manual transmission better for MPG"
# Qn 2. Quantify the MPG difference between automatic and manual transmissions

data(mtcars)

####Convert some mtcars variables into factors

mtcars$cyl <- factor(mtcars$cyl)

mtcars$vs <- factor(mtcars$vs)

mtcars$am <- factor(mtcars$am, labels = c("Automatc", "Manual"))

mtcars$gear  <- factor(mtcars$gear)

mtcars$carb <- factor(mtcars$carb)





# Just analyzing data based on question - To check the impact on mpg with transmission mode

# Plot 1 -  box-plot

boxplot(mpg ~ am, data = mtcars, col = (c("violet","green")), ylab = "Miles/(US) gallon", xlab = "Transmission (0 = automatic, 1 = manual)")

# We can observe that there is an impact on MPG with automatic transmission having a lower MPG.


# Model building using Regression

# Mathematically check the impact on MPG with transmission type

aggregate(mpg ~ am, data = mtcars, mean)


# Checking the difference in MPG for automatic and manual transmission type

aggregate(mpg ~ am, data = mtcars, mean)[2,2] - aggregate(mpg ~ am, data = mtcars, mean)[1,2]  


# So we can hypothesize that automatic cars have MPG 7.2449 lower than manual cars.

# Test using t-test to check whether this differnece is significant

T_automatic <- mtcars[mtcars$am=="Automatc",]

T_manual <- mtcars[mtcars$am=="Manual",]

t.test(T_automatic$mpg,T_manual$mpg)


# The p-value obtained is 0.001374. So this is a significant differenec.


# Next, builing the model using linear regression

first_model <- lm(mpg ~ am, data = mtcars)

summary(first_model)

# Summary shows that the average MPG for automatic is 17.15 MPG and manual is 7.2 MPG higher.

# The R^2 value is 0.36 means this model explains only 36 % of the variance. So we have to build a multivariate linear regression.

# We can include other variables to make it more accurate. Selection of the new vraiables to be included is based on the pairs plot which shows the variable correlation with mpg.

# From the pairs plot we can observe that cyl, disp, hp, wt have the strongest correlation with mpg.

# Building a new model based on multivariate linear regression and compare it to the initial model using anova function.

second_model <- lm(mpg ~ am + cyl + disp + hp + wt, data = mtcars)

anova(first_model, second_model)

# The new p-value is 8.637e-08. Which is far better than the initial model

# We check again the residuals for non-normality and can observe that all normally distributed and homoskedastic. 

summary(second_model)

# So it is clear from the summary that model explains 86.64 % of the variance and as a result variables cyl, hp, disp, wt affected the correlation between mpg and am.

# So we can say that the difference between automatic and manual transmissions is 1.81 MPG



# Plot 2 - Pairs plot

pairs(mpg ~ ., data = mtcars)

# Plot 3 - Residuals

par(mfrow = c(2,2))

plot(second_model)




















