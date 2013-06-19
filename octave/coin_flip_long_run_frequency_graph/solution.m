% Goal: Toss a coin N times and compute the running proportion of heads.
N = 500; % Specify the total number of flips, denoted N.
% Generate a random sample of N flips for a fair coin (heads=1, tails=0);
% the function "sample" is part of R:
%set.seed(47405) % Uncomment to set the "seed" for the random number generator.

% generate N samples representing coin flips
flipsequence = binornd(1, 0.5, 1, N);

% Compute the running proportion of heads:
r = cumsum( flipsequence ); % The function "cumsum" is built in to R.
n = 1:N;                    % n is a vector.
runprop = r ./ n;           % component by component division.
% Graph the running proportion:
semilogx(n, runprop, "-o");
axis([1, N, 0, 1], "normal")
title("Running Proportion of Heads")
xlabel("Flip Number")
ylabel("Proportion Heads")

% Plot a horizontal line at y=.5, just as a reference line:
hold
plot([1, N], [.5, .5], "-k")
hold
% Display the beginning of the flip sequence. These string and character
% manipulations may seem mysterious, but you can de-mystify by unpacking
% the commands starting with the innermost parentheses or brackets and
% moving to the outermost.
flipletters = ["T","H"](flipsequence( 1:10 ) .+ 1);
displaystring = sprintf("Flip Sequence = %s...", flipletters);
text(5, .9, displaystring)
% Display the relative frequency at the end of the sequence.
text(N*.9, .3, sprintf("End Proportion = %0.3f", runprop(N)), "horizontalalignment", "right")
