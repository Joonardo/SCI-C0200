function [s, j] = dayinabar (lambda, mu, smax)
    
    j = 0;
    s = 1;
    t = 0;
    
    while t < 8*60
        arriving = realisation(lambda, t, t + 1);
        leaving = realisation(1/mu_j(mu, s(end), j(end)), t, t + 1);
        j(end + 1) = max(j(end) + arriving - leaving, 0);
        s(end+1) = floor(min(max(j(end), 1), smax));
        t = t + 1;
    end
    j = j-s;
    j(j<0) = 0;
    
end