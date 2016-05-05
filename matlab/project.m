function [] = project()
    s = 2;
    j = [0];
    t = 0;
    lambda = 40/60;
    mu = 4;
    
    while t < 8*60
        arriving = realisation(lambda, t, t + 1);
        leaving = realisation(1/mu_j(mu, s, j(end)), t, t + 1);
        j(end + 1) = j(end) + arriving - leaving;
        t = t + 1
    end
    stairs(0:8*60, j)
end