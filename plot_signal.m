 function plot_signal(signal, delta)
    time=(1/delta)*2000; %choose upper bound of 2000 samples and calculate corresponding time
    t=linspace(0,time,2000); %make times to plot signal strength against
    clf
    plot(t,signal(1:2000)) 
    xlabel('time (sec)');
    ylabel('relative signal strength')
 end