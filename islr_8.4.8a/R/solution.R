library(caret)
library(ISLR)
data(Carseats)
train=createDataPartition(Carseats$Sales, p=0.7, list=FALSE)
Carseats.train=Carseats[train,]
Carseats.test=Carseats[-train,]
