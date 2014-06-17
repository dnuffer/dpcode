library(caret)
library(MASS)
data(Boston)
train = createDataPartition(Boston$medv, p=0.7, list=FALSE)
Boston.rf = train(medv~., data=Boston[train,], method="rf", trControl=trainControl(method="cv", number=3), tuneLength=3)
Boston.rf
summary(Boston.rf)
plot(Boston.rf)
Boston.rf$finalModel
summary(Boston.rf$finalModel)
plot(Boston.rf$finalModel)
RMSE(predict(Boston.rf, newdata=Boston[-train,]), Boston[-train,]$medv)
importance(Boston.rf$finalModel)
varImpPlot(Boston.rf$finalModel)
