function [ avgs, avgj ] = montecarlo( lambda, mu, smax, N )
%MONTECARLO Summary of this function goes here
%   Detailed explanation goes here
    avgs = [];
    avgj = [];
    for n = 1:N
        [s, j] = dayinabar(lambda, mu, smax);
        avgs(end + 1) = mean(s);
        avgj(end + 1) = mean(j);
    end

end
