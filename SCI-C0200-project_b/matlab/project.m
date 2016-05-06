function [] = project()
    j = [0];
    t = 0;
    lambda = 40/60;
    mu = 4;
    jono_tavoite = 5; %jonon tavoitepituus
    smin = 1; %kassahenkilökunnan määrä minimissään
    smax = ceil(mu*lambda)+1; %kassahenkilökunnan määrä maksimissaan
    s = [smin];
    
    while t < 8*60
        arriving = realisation(lambda, t, t + 1);
        leaving = realisation(1/mu_j(mu, s(end), j(end)), t, t + 1);
        j(end + 1) = max(j(end) + arriving - leaving, 0);
        s(end+1) = floor(min(max(j(end) - jono_tavoite, smin), smax));
        t = t + 1;
    end
    close all
    stairs(0:t, j-s)
    hold on
    stairs(0:t, s)
end
