library(caret)
library(ISLR)
data(OJ)
train=createDataPartition(OJ$Purchase, p=0.8, list=FALSE)
OJ.train=OJ[train,]
OJ.test=OJ[-train,]
# TODO: Fit a tree to the training data, with Purchase as the response and the other variables as predictors. Use the summary() function to produce summary statistics about the tree, and describe the results obtained. What is the training error rate? How many terminal nodes does the tree have?
