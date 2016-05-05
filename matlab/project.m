function [] = project()
    s = 2;
    j = [0];
    t = 0;
    lambda = 40/60;
    mu = 4;
    
    while t < 8*60
        arriving = realisation(lambda, t, t + 1);
        leaving = realisation(1/mu_j(mu, s, j(end)), t, t + 1);
        j(end + 1) = max(j(end) + arriving - leaving, 0);
        t = t + 1;
    end
    stairs(0:t, j)
end
