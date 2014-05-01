library(ISLR)
library(caret)
data(Hitters)
Hitters = Hitters[!is.na(Hitters$Salary),]
Hitters$Salary = log(Hitters$Salary)

# TODO: Create a training set consisting of the first 200 observations, and a test set consisting of the remaining observations.
