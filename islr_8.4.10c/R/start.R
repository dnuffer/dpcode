library(ISLR)
library(caret)
data(Hitters)
Hitters = Hitters[!is.na(Hitters$Salary),]
Hitters$Salary = log(Hitters$Salary)

Hitters.train = Hitters[1:200,]
Hitters.test = Hitters[201:nrow(Hitters),]

# TODO: Perform boosting on the training set with 1,000 trees for a range of values of the shrinkage parameter λ. Produce a plot with different shrinkage values on the x-axis and the corresponding training set MSE on the y-axis.

