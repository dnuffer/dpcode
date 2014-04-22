library(ISLR)
library(caret)
data(Hitters)
Hitters = Hitters[!is.na(Hitters$Salary),]
Hitters$Salary = log(Hitters$Salary)

Hitters.train = Hitters[1:200,]
Hitters.test = Hitters[201:nrow(Hitters),]

Hitters.bag = train(Salary~., Hitters.train, method="treebag", trControl=trainControl(method="repeatedcv", repeats=3), tuneLength=3)

RMSE(predict(Hitters.bag, newdata=Hitters.test), Hitters.test$Salary)
