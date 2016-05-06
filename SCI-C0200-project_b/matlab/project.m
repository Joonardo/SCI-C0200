function [] = project()
    lambda = 40/60;
    mu = 4;
    smax = ceil(mu*lambda); %kassahenkilökunnan määrä maksimissaan

    figure
    for i = 0:3
        [avgs, avgj, maxsprop] = montecarlo(lambda, mu, smax+i, 1000);
        runningavgs = mean(avgs);
        runningavgj = mean(avgj);
        
        subplot(4,3, 3*i+2)
        histogram(avgs)
        str = strcat(sprintf('kokonaiskeskiarvo = %d, kaikki kassat %i', runningavgs, round(100*maxsprop)), '% käytössä');
        title(str)
        xlabel('Kassoja auki keskimäärin per päivä')
        ylabel('Frekvenssi')
        
        subplot(4,3, 3*i+3)
        histogram(avgj)
        str = sprintf('kokonaiskeskiarvo: %d', runningavgj);
        title(str)
        xlabel('Jonon pituus keskimäärin per päivä')
        ylabel('Frekvenssi')
        
        subplot(4,3,3*i+1)
        [s, j] = dayinabar(lambda, mu, smax+i);
        stairs(linspace(0, 8, length(j)), j)
        hold on
        stairs(linspace(0, 8, length(s)), s)
        title(sprintf('Esimerkkipäivä, ylimääräisiä kassoja käytettävissä %i', i))
        xlabel('Aika (h)')
        legend('Jonon pituus', 'Kassoja auki')
    end

end
