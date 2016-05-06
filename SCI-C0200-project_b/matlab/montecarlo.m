function [ avgs, avgj, maxsprop ] = montecarlo( lambda, mu, smax, N )
%MONTECARLO Summary of this function goes here
%   Detailed explanation goes here
    avgs = [];
    avgj = [];
    maxsprop = [];
    for n = 1:N
        [s, j, maxspr] = dayinabar(lambda, mu, smax);
        avgs(end + 1) = mean(s);
        avgj(end + 1) = mean(j);
        maxsprop(end+1) = maxspr;
    end
    maxsprop = mean(maxsprop);
end
