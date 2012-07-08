x=seq(from=-3,to=3,by=0.1)
y=x^3
# save the plot of y = x^3 as graph.png in png format
png(filename="graph.png", width=600, height=600)
plot(x,y,type="l")
dev.off()
