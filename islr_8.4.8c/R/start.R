library(caret)
library(ISLR)
data(Carseats)
train=createDataPartition(Carseats$Sales, p=0.7, list=FALSE)
Carseats.train=Carseats[train,]
Carseats.test=Carseats[-train,]
# TODO: Use cross-validation in order to determine the optimal level of tree complexity. Does pruning the tree improve the test error rate?
