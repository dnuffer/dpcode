library(ISLR)
library(caret)
data(Hitters)
Hitters = Hitters[!is.na(Hitters$Salary),]
Hitters$Salary = log(Hitters$Salary)

Hitters.train = Hitters[1:200,]
Hitters.test = Hitters[201:nrow(Hitters),]

Hitters.gbm = train(Salary~., data=Hitters.train, method="gbm", trControl=trainControl(method="repeatedcv", repeats=3), tuneLength=3)

