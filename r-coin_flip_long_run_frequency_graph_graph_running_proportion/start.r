# Goal: Toss a coin N times and compute the running proportion of heads.
N = 500	# Specify the total number of flips, denoted N.
# Generate a random sample of N flips for a fair coin (heads=1, tails=0);
# the function "sample" is part of R:
#set.seed(47405) # Uncomment to set the "seed" for the random number generator.
flipsequence = sample( x=c(0,1) , prob=c(.5,.5) , size=N , replace=TRUE )
r = cumsum( flipsequence )
n = 1:N
runprop = r / n




##################################################
#
# Graph the running proportion:
# x axis label: "Flip Number"
# x range 1-N, log scale
# y axis label: "Proportion Heads"
# y range 0-1
# main label:   "Running Proportion of Heads"
# axis, labels, and titles should all be magnified by 1.5x
#


# Plot a dotted horizontal line at y=.5, just as a reference line:
lines( c(1,N) , c(.5,.5) , lty=3 )
# Display the beginning of the flip sequence. These string and character
# manipulations may seem mysterious, but you can de-mystify by unpacking
# the commands starting with the innermost parentheses or brackets and
# moving to the outermost.
flipletters = paste( c("T","H")[ flipsequence[ 1:10 ] + 1 ] , collapse="" )
displaystring = paste( "Flip Sequence = " , flipletters , "..." , sep="" )
text( 5 , .9 , displaystring , adj=c(0,1) , cex=1.3 )
# Display the relative frequency at the end of the sequence.
text( N , .3 , paste("End Proportion =",runprop[N]) , adj=c(1,0) , cex=1.3 )
