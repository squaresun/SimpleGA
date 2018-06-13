%% Finding the fittest individual
function [mostFitS] = mostFit(f, S, ordering)

% ordering = 'ascend' in default
if ~exist('ordering','var')
    ordering = 'ascend';
end

[~, index] = sort(fitness(f, S), ordering);

mostFitS = S(index(1), :);