library(caret)
library(ISLR)
data(OJ)
train=createDataPartition(OJ$Purchase, p=0.8, list=FALSE)
OJ.train=OJ[train,]
OJ.test=OJ[-train,]
