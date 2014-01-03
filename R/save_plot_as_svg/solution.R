x=seq(from=-3,to=3,by=0.1)
y=x^3
# save the plot of y = x^3 as graph.svg in svg format
svg(filename="graph.svg", width=6, height=6)
plot(x,y,type="l")
dev.off()
