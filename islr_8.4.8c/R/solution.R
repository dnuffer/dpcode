library(caret)
library(ISLR)
data(Carseats)
train=createDataPartition(Carseats$Sales, p=0.7, list=FALSE)
Carseats.train=Carseats[train,]
Carseats.test=Carseats[-train,]
Carseats.rf = train(Sales ~ ., data=Carseats.train, method="rf", trControl = trainControl(method="repeatedcv", repeats=3), tuneLength = 3)
Carseats.rf
