function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic 
%regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a 
%   threshold at 0.5 (i.e., if sigmoid(x*theta) >= 0.5, predict 1)


end

%!test
%! t = [  -25.16154; 0.20623; 0.20147];
%! assert(predict(t, [1.0 45 85]), 1.0, 1e-2);
%! assert(predict(t, [1.0 45 85; 1.0 30 30]), [1.0; 0.0], 1e-2);

