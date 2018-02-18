data = read.table("ex2data1.txt", sep=",")
X = data[,1:2]
y = data[,3]
pos = y==1
neg = y==0
plot(X[pos,1], X[pos,2], col="black", pch=3, xlab="Exam 1 score", ylab="Exam 2 score")
points(X[neg,1], X[neg,2], col="yellow", pch=19)
legend(40, 50, legend=c("Admitted", "Not admitted"))
