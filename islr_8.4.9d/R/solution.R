library(caret)
library(ISLR)
data(OJ)
train=createDataPartition(OJ$Purchase, p=0.8, list=FALSE)
OJ.train=OJ[train,]
OJ.test=OJ[-train,]
OJ.tree = train(Purchase ~ ., data=OJ.train, method="rpart", trControl = trainControl(method="repeatedcv", repeats=5), tuneLength = 10)
plot(OJ.tree$finalModel)
text(OJ.tree$finalModel)
