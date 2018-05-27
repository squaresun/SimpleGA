function [mostFitS] = mostFit(f, S)

fitMat = fitness(f, S);

[~, index] = sort(fitMat, 'ascend');

mostFitS = S(index(1), :);