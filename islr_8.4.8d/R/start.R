library(caret)
library(ISLR)
data(Carseats)
train=createDataPartition(Carseats$Sales, p=0.7, list=FALSE)
Carseats.train=Carseats[train,]
Carseats.test=Carseats[-train,]
# TODO: Use the bagging approach to analyze this data. 
# What test error rate do you obtain? 
# Use the varImp() function to determine which variables are most important. 
