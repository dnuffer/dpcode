library(caret)
library(ISLR)
data(Carseats)
train=createDataPartition(Carseats$Sales, p=0.7, list=FALSE)
Carseats.train=Carseats[train,]
Carseats.test=Carseats[-train,]
# TODO: Use the bagging approach to analyze this data. 
# What test error rate do you obtain? 
# Use the importance() function to determine which variables are most important. 
Carseats.mdl = train(Sales ~ ., data=Carseats.train, method="treebag", trControl=trainControl(method="repeatedcv", repeats=10, number=10), tuneLength=10)
Carseats.mdl
summary(Carseats.mdl)
plot(Carseats.mdl)
RMSE(predict(Carseats.mdl, newdata=Carseats.test), Carseats.test$Sales)
varImp(Carseats.mdl)
