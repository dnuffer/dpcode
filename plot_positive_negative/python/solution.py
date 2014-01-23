from pylab import *
import numpy

data = numpy.loadtxt(open("ex2data1.txt", "rb"), delimiter=",", skiprows=0)
X = data[:, 0:2]
y = data[:, 2]

print("Plotting data with + indication (y = 1) examples and o indicationg (y = 0) examples.")

pos = nonzero(y == 1)
print("pos: %s" % pos)
neg = nonzero(y == 0)
print("neg: %s" % neg)

print("X pos: %s, %s" % (X[pos, :][0], X[pos, :][1]))
print("X neg: %s, %s" % (X[neg, :][0], X[neg, :][1]))
plot(X[pos[0], :][0], X[pos[0], :][1], "+")
plot(X[neg[0], :][0], X[pos[0], :][1], "o")

show()
