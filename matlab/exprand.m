function r = exprand( N, lambda )
%exprand Generates exponentially divided random numbers
%   exprand( N, lambda ) returns N random numbers. Lambda is inverse of
%   estimated value.

    r = -1/lambda*log(1 - rand(N, 1));

end