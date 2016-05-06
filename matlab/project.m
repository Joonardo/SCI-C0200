function re = project()
    t = [0];
    lambda = 40;
    while t(end) < 1
        t(end + 1) = t(end) + poisson(lambda);
    end
    stairs(t, 1:length(t))
    re = length(t) - 1;
end