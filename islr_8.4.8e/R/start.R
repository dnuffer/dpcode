library(caret)
library(ISLR)
data(Carseats)
train=createDataPartition(Carseats$Sales, p=0.7, list=FALSE)
Carseats.train=Carseats[train,]
Carseats.test=Carseats[-train,]
# TODO: Use random forests to analyze this data. 
# What test error rate do you obtain? 
# Use the importance() function to determine which variables are most important. 
# Describe the effect of m, the number of variables considered at each split, on the error rate obtained.
