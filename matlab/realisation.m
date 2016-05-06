function res = realisation( lambda, t1, t2 )
%realisation returns the realisation of poisson distribution
%   between t1 and t2.

    t = [t1];
    while t(end) < t2
        t(end + 1) = t(end) + poisson(lambda);
    end
    res = length(t) - 2; 
    % Koska poisson-funktiota ollaan kutsuttu length(t) - 1 kertaa.
end

