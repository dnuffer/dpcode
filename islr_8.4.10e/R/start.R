library(ISLR)
library(caret)
data(Hitters)
Hitters = Hitters[!is.na(Hitters$Salary),]
Hitters$Salary = log(Hitters$Salary)

Hitters.train = Hitters[1:200,]
Hitters.test = Hitters[201:nrow(Hitters),]

Hitters.gbm = train(Salary~., data=Hitters.train, method="gbm", trControl=trainControl(method="repeatedcv", repeats=3), tuneLength=3)

# TODO: Compare the test MSE of boosting to the test MSE that results from applying two of the regression approaches seen in Chapters 3 (lm() - linear model) and 6 (pls() - partial least squares).
Hitters.lm = train(Salary~., data=Hitters.train, method="lm", trControl=trainControl(method="repeatedcv", repeats=3), tuneLength=3)
Hitters.pls = train(Salary~., data=Hitters.train,
                    method="pls",
                    trControl=trainControl(method="repeatedcv", repeats=3),
                    tuneLength=3)
mse = function(pred, actual) { mean((pred - actual)^2) }
salary_mse = function(mdl) { mse(predict(mdl, newdata=Hitters.test), Hitters.test$Salary)}
salary_mse(Hitters.gbm)
salary_mse(Hitters.lm)
salary_mse(Hitters.pls)
#mse(predict(Hitters.gbm, newdata=Hitters.test), Hitters.test$Salary)
#mse(predict(Hitters.lm))
