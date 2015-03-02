close all

%%================================================================
%% Step 0: Load data
%  x is a 2 * 45 matrix, where the kth column x(:,k) corresponds to
%  the kth data point.

% TODO: load the data from pcaData.txt into x

figure(1);
scatter(x(1, :), x(2, :));
title('Raw data');


