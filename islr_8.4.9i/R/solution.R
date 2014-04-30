library(caret)
library(ISLR)
data(OJ)
train=createDataPartition(OJ$Purchase, p=0.8, list=FALSE)
OJ.train=OJ[train,]
OJ.test=OJ[-train,]
# TODO: Produce a pruned tree corresponding to the optimal tree size obtained using cross-validation. If cross-validation does not lead to selection of a pruned tree, then create a pruned tree with five terminal nodes.
OJ.tree = train(Purchase ~ ., data=OJ.train, method="rpart", trControl = trainControl(method="repeatedcv", repeats=3), tuneLength = 3)
