function [S_new] = wrw(f, S)

fitS = fitness(f, S);

alphaS = fitS / sum(fitS, 2);

for i = 2:size(alphaS, 2)
    alphaS(i) = alphaS(i) + alphaS(i - 1);
end

alphaS = [0 alphaS];

S_new = zeros(size(S));

[~, alphaIndex] = sort(fitS, 'descend');

sortedS = sortSWithFit(f, S);

for i = 1:size(S, 1)
    randomNum = rand;
    for j = 1:size(alphaS, 2) - 1
        if randomNum >= alphaS(j) && randomNum <= alphaS(j + 1)
            S_new(i, :) = sortedS(alphaIndex == j, :);
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
