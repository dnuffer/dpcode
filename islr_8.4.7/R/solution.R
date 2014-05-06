library(caret)
library(MASS)
data(Boston)
train=createDataPartition(Boston$medv, p=0.7, list=FALSE)
Boston.train=Boston[train,]
Boston.test=Boston[-train,]
p = ncol(Boston) - 1
grid = expand.grid( ntree=seq(10,500,by=10), mtry=p)
Boston.rf.p = train(medv ~ ., data=Boston.train, method="rf", trControl = trainControl(method="cv", number=3), tuneGrid = grid)

