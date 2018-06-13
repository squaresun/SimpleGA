function [result] = simpleGA(f, nvars, ngen, retryTimes, plotFunc)

if ~exist('plotFunc','var')
    % plotFunc = empty function
    plotFunc = emptyFunc;
end

% Initialize population
S = rand(ngen, nvars);

% Iterates until retryTimes reached
for retry = 1:retryTimes
    S = wrw(f, S);
    S = reproduction(S, 10);
    S = mutation(S, 10);
    plotFunc(S);
end

% Return the most fit instance as result
result = mostFit(f, S);

function emptyFunc(varargin)