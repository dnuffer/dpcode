library(ISLR)
library(caret)
data(Hitters)
Hitters = Hitters[!is.na(Hitters$Salary),]
Hitters$Salary = log(Hitters$Salary)

Hitters.train = Hitters[1:200,]
Hitters.test = Hitters[201:nrow(Hitters),]

Hitters.gbm = train(Salary~., data=Hitters.train, trControl(method="repeatedcv", number=3, repeats=3), method="gbm", tuneGrid=expandGrid(shrinkage=c(0.001, 0.01, 0.1, 0.2, 0.5), n.trees=1000, interaction.depth=4))

plot(Hitters.gbm)
