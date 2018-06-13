%% reproduction crossovers all parents in S
% n = encoding binary size
function [S_new] = reproduction(S, n)

S_new = zeros(size(S));

indices = randperm(size(S, 1));

for i = 1:2:size(S, 1) - 1
    a = floor(S(indices(i), :).*(2^n - 1));
    b = floor(S(indices(i + 1), :).*(2^n - 1));
    aBin = dec2bin(a, n);
    bBin = dec2bin(b, n);

    for j = 1:size(aBin, 1)
        crossIndex = min(floor(rand * size(aBin, 2)) + 1, size(aBin, 2));

        tmp = aBin(j, crossIndex:end);
        aBin(j, crossIndex:end) = bBin(j, crossIndex:end);
        bBin(j, crossIndex:end) = tmp;

        S_new(i, j) = bin2dec(aBin(j, :)) / (2^n - 1);
        S_new(i + 1, j) = bin2dec(bBin(j, :)) / (2^n - 1);
    end
end
