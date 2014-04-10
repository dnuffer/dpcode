library(ISLR)
library(caret)
data(Hitters)
Hitters = Hitters[!is.na(Hitters$Salary),]
Hitters$Salary = log(Hitters$Salary)

Hitters.train = Hitters[1:200,]
Hitters.test = Hitters[201:nrow(Hitters),]

Hitters.gbm = train(Salary~., data=Hitters.train, method="gbm", trControl=trainControl(method="repeatedcv", repeats=10), tuneLength=10)

Hitters.lm = train(Salary~., data=Hitters.train, method="lm", trControl=trainControl(method="repeatedcv", repeats=10), tuneLength=10)

Hitters.pls = train(Salary~., data=Hitters.train, method="pls", trControl=trainControl(method="repeatedcv", repeats=10), tuneLength=10)

RMSE(predict(Hitters.gbm, newdata=Hitters.test), Hitters.test$Salary)

RMSE(predict(Hitters.lm, newdata=Hitters.test), Hitters.test$Salary)

RMSE(predict(Hitters.pls, newdata=Hitters.test), Hitters.test$Salary)

Hitters.rs = resamples(list(gbm = Hitters.gbm, lm = Hitters.lm, pls = Hitters.pls))
Hitters.rs
bwplot(Hitters.rs)