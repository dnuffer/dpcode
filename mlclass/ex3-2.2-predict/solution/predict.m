function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

nex = rows(X);
nfeat = columns(X);
nnodes1 = rows(Theta1);
% X      - #examples,#features
% Theta1 - #nodes1,  #features+1

% a1     - #features+1,#examples
a1 = [ones(nex, 1) X]';
% Theta1b- #nodes1+1,#features+1
#Theta1b = [ones(1, nfeat + 1); Theta1]; 
% z2 - #nodes1,#examples
% a2 - #nodes1+1,#examples
z2 = Theta1 * a1;
a2 = [ones(1, nex); sigmoid(z2)];
% Theta2 - #labels,  #nodes1+1
% z3,a3 - #labels, #examples
z3 = Theta2 * a2;
a3 = sigmoid(z3);
% p      - #examples,1


[max, p] = max(a3', [], 2);

%disp(p)




% =========================================================================


end
