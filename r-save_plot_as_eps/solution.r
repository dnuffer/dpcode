x=seq(from=-3,to=3,by=0.1)
y=x^3
plot(x,y,type="l")

# save the plot of y = x^3 as graph.eps in eps format
dev.copy2eps(file="graph.eps")
