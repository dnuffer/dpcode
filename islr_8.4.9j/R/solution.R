library(caret)
library(ISLR)
data(OJ)
train=createDataPartition(OJ$Purchase, p=0.8, list=FALSE)
OJ.train=OJ[train,]
OJ.test=OJ[-train,]
OJ.tree = train(Purchase ~ ., data=OJ.train, method="rpart", trControl = trainControl(method="repeatedcv", repeats=3), tuneLength = 3)
OJ.tree.no.prune = train(Purchase ~ ., data=OJ.train, method="rpart", trControl = trainControl(method="none"), tuneGrid = expand.grid(cp=0))
confusionMatrix(predict(OJ.tree, newdata=OJ.train), OJ.train$Purchase)
confusionMatrix(predict(OJ.tree.no.prune, newdata=OJ.train), OJ.train$Purchase)
