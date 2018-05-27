function [S] = simpleGA(f, nvars, ngen, plotFunc)

S = rand(ngen, nvars);

S_old = zeros(size(S));

retry = 1;

while retry < 100
    f(mostFit(f, S))

    S_old = S;

    S = wrw(f, S);

    S = reproduction(S, 10);

    S = mutation(S, 10);

    fitS = mostFit(f, S);

    plotFunc(fitS);

    retry = retry + 1;
end

S = S_old;

function [mostFitS] = mostFit(f, S)

fitMat = fitness(f, S);

[~, index] = sort(fitMat, 'ascend');

mostFitS = S(index(1), :);