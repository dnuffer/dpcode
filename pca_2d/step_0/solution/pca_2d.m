close all

%%================================================================
%% Step 0: Load data
%  x is a 2 * 45 matrix, where the kth column x(:,k) corresponds to
%  the kth data point.

x = load('pcaData.txt','-ascii');
figure(1);
scatter(x(1, :), x(2, :));
title('Raw data');


