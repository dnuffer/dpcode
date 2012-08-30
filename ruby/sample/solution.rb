require 'rubygems'
require 'gruff'

class Array
  def sample(n, pdf = nil)
    pdf ||= Array.new(size, 1.0 / size)

    cdf = pdf.inject([0]) do |c, a|
      c << a + c.last
    end

    Array.new(n) do
      r = rand

      self[[size, cdf.rindex{|x| x <= r}].min]
    end
  end

end

module Enumerable
  def cumsum
    inject([]) { |memo, obj| memo.push(obj + (memo.length > 0 ? memo.last : 0)) }
  end
end

# Goal: Toss a coin N times and compute the running proportion of heads.
N = 500	# Specify the total number of flips, denoted N.
# Generate a random sample of N flips for a fair coin (heads=1, tails=0);
# the function "sample" is part of R:
#set.seed(47405) # Uncomment to set the "seed" for the random number generator.
flipsequence = [0.0, 1.0].sample( N, [0.5, 0.5] )

# Compute the running proportion of heads
r = flipsequence.cumsum()
runprop = r.each_with_index.map { |x,i| x/(i+1) } 


# Graph the running proportion:
# To learn about the parameters of the plot function,
# type help('par') at the R command prompt.
# Note that "c" is a function in R.
#plot( n , runprop , type="o" , log="x" ,
#	  xlim=c(1,N) , ylim=c(0.0,1.0) , cex.axis=1.5 ,
#	  xlab="Flip Number" , ylab="Proportion Heads" , cex.lab=1.5 ,
#	  main="Running Proportion of Heads" , cex.main=1.5 )

# Gruff can't do log scale on the axis
g = Gruff::Line.new
g.dot_radius = 3
g.marker_count = 5
g.title = "Running Proportion of Heads" 

g.data("Proportion Heads", runprop)

g.maximum_value = 1.0
g.minimum_value = 0.0
g.x_axis_label = "Flip Number"
g.y_axis_label = "Proportion Heads"

#g.labels = {0 => '2003', 2 => '2004', 4 => '2005'}
g.labels = Hash[(1..10).map {|x| flip = x * N / 10;  [flip - 1, flip.to_s] }]
g.labels[0] = "1"

g.hide_legend = true

g.write('mygraph.png')

# Plot a dotted horizontal line at y=.5, just as a reference line:
#lines( c(1,N) , c(.5,.5) , lty=3 )
# Display the beginning of the flip sequence. These string and character
# manipulations may seem mysterious, but you can de-mystify by unpacking
# the commands starting with the innermost parentheses or brackets and
# moving to the outermost.
#flipletters = paste( c("T","H")[ flipsequence[ 1:10 ] + 1 ] , collapse="" )
#displaystring = paste( "Flip Sequence = " , flipletters , "..." , sep="" )
#text( 5 , .9 , displaystring , adj=c(0,1) , cex=1.3 )
# Display the relative frequency at the end of the sequence.
#text( N , .3 , paste("End Proportion =",runprop[N]) , adj=c(1,0) , cex=1.3 )
