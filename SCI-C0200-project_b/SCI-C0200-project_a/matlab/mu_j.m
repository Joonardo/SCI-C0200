function res = mu_j( mu, s, j )

    if j <= s
        res = mu/j;
    else
        res = mu/s;
    end
end

