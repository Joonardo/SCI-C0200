function [] = project()
    lambda = 40/60;
    mu = 4;
    smax = ceil(mu*lambda); %kassahenkil�kunnan m��r� maksimissaan

    figure
    for i = 0:3
        [avgs, avgj, maxsprop] = montecarlo(lambda, mu, smax+i, 1000);
        runningavgs = mean(avgs);
        runningavgj = mean(avgj);
        
        subplot(4,3, 3*i+2)
        histogram(avgs)
        str = strcat(sprintf('kokonaiskeskiarvo = %d, kaikki kassat %i', runningavgs, round(100*maxsprop)), '% k�yt�ss�');
        title(str)
        xlabel('Kassoja auki keskim��rin per p�iv�')
        ylabel('Frekvenssi')
        
        subplot(4,3, 3*i+3)
        histogram(avgj)
        str = sprintf('kokonaiskeskiarvo: %d', runningavgj);
        title(str)
        xlabel('Jonon pituus keskim��rin per p�iv�')
        ylabel('Frekvenssi')
        
        subplot(4,3,3*i+1)
        [s, j] = dayinabar(lambda, mu, smax+i);
        stairs(linspace(0, 8, length(j)), j)
        hold on
        stairs(linspace(0, 8, length(s)), s)
        title(sprintf('Esimerkkip�iv�, ylim��r�isi� kassoja k�ytett�viss� %i', i))
        xlabel('Aika (h)')
        legend('Jonon pituus', 'Kassoja auki')
    end

end
