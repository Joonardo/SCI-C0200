function [] = project()
    lambda = 40/60;
    mu = 4;
    smax = ceil(mu*lambda); %kassahenkilökunnan määrä maksimissaan
%     
%     while t < 8*60
%         arriving = realisation(lambda, t, t + 1);
%         leaving = realisation(1/mu_j(mu, s(end), j(end)), t, t + 1);
%         j(end + 1) = max(j(end) + arriving - leaving, 0);
%         s(end+1) = floor(min(max(j(end) - jono_tavoite, smin), smax));
%         t = t + 1;
%     end
%     close all
%     stairs(0:t, j-s)
%     hold on
%     stairs(0:t, s)

    figure
    for i = 0:3
        [avgs, avgj] = montecarlo(lambda, mu, smax+i, 1000);
        runningavgs = mean(avgs);
        runningavgj = mean(avgj);
        
        subplot(4,3, 3*i+2)
        histogram(avgs)
        str = sprintf('N = 1000, kokonaiskeskiarvo = %d', runningavgs);
        title(str)
        xlabel('Kassoja auki keskimäärin per päivä')
        ylabel('Frekvenssi')
        
        subplot(4,3, 3*i+3)
        histogram(avgj)
        str = sprintf('N = 1000, kokonaiskeskiarvo: %d', runningavgj);
        title(str)
        xlabel('Jonon pituus keskimääräinen per päivä')
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
