function [S_new] = wrw(f, S, ordering)

% ordering = 'descend' in default
if ~exist('ordering','var')
    ordering = 'descend';
end

fitS = fitness(f, S);

% Sort the probabilities of selection
alphaS = sort(fitS / sum(fitS, 2), ordering);

% Accumulated probabilities; alphaS(end) is equal to 1
for i = 2:size(alphaS, 2)
    alphaS(i) = alphaS(i) + alphaS(i - 1);
end

% Append 0 in front of the probabilities
alphaS = [0 alphaS];

S_new = zeros(size(S));

% Sorting individuals with the corresponding fitness, in ascending order
sortedS = sortSWithFit(f, S);

for i = 1:size(S, 1)
    randomNum = rand;
    for j = 1:size(alphaS, 2) - 1
        % If random number falls into interval
        if randomNum >= alphaS(j) && randomNum <= alphaS(j + 1)
            % Clone the corresponding individual
            S_new(i, :) = sortedS(j, :);
            break;
        end
    end
end

function [sortedS] = sortSWithFit(f, S)

fitS = fitness(f, S);

sortedFitS = sort(fitS, 'ascend');
sortedS = zeros(size(S));
for i = 1:size(S, 1)
    indices = find(sortedFitS == fitS(i));
    for j = 1:size(indices, 2)
        sortedS(indices(1, j), :) = S(i, :);
    end
end
