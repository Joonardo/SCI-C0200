function prnd = poisson( arg )
%poisson returns random number from poisson distribution.
%   poisson( N, arg ) returns random number from 
%       poisson distribution with intensity arg.

    prnd = exprand(1, 1/arg);
end

