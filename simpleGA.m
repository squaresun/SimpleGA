function [result] = simpleGA(f, nvars, ngen, retryTimes, plotFunc)

S = rand(ngen, nvars);

retry = 1;

while retry < retryTimes
    S = wrw(f, S);

    S = reproduction(S, 10);

    S = mutation(S, 10);

    plotFunc(S);

    retry = retry + 1;
end

result = mostFit(f, S);