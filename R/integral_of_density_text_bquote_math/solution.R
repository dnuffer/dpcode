# Graph of normal probability density function, with comb of intervals.
meanval = 0.0             # Specify mean of distribution.
sdval = 0.2               # Specify standard deviation of distribution.
xlow  = meanval - 3*sdval # Specify low end of x-axis.
xhigh = meanval + 3*sdval # Specify high end of x-axis.
dx = 0.02                 # Specify interval width on x-axis
# Specify comb points along the x axis:
x = seq( from = xlow , to = xhigh , by = dx )
# Compute y values, i.e., probability density at each value of x:
y = ( 1/(sdval*sqrt(2*pi)) ) * exp( -.5 * ((x-meanval)/sdval)^2 )
# Plot the function. "plot" draws the intervals. "lines" draws the bell curve.
plot( x , y , type="h" , lwd=1 , cex.axis=1.5
	, xlab="x" , ylab="p(x)" , cex.lab=1.5
	, main="Normal Probability Density" , cex.main=1.5 )
lines( x , y )
# Approximate the integral as the sum of width * height for each interval.
area = sum( dx * y )
# Display info in the graph.


###############################################################
#
# TODO: draw mu = <val>
text( -sdval , .9*max(y) , bquote( paste(mu ," = " ,.(meanval)) )
      , adj=c(1,.5) )

###############################################################
#
# TODO: draw sigma = <val>
text( -sdval , .8*max(y) , bquote( paste(sigma ," = " ,.(sdval)) )
      , adj=c(1,.5) )

###############################################################
#
# TODO: draw delta x = <val>
text( sdval , .9*max(y) , bquote( paste(Delta , "x = " ,.(dx)) )
      , adj=c(0,.5) )

###############################################################
#
# TODO: draw sum over x of delta x p(x) = <val to 3 significant digits>
text( sdval , .8*max(y) ,
      bquote(
        paste( sum(,x,) , " " , Delta , "x p(x) = " , .(signif(area,3)) )
      ) , adj=c(0,.5) )
