% 
% figure
% 
% fsamp = 8000;
% fcuts = [1000 1500];
% mags = [1 0];
% devs = [0.05 0.01];
% 
% [n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);
% hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');
% 
% freqz(hh,1,1024,fsamp)
% 
% 
% lpFilt = designfilt('lowpassfir','PassbandFrequency',0.25, ...
%          'StopbandFrequency',0.35,'PassbandRipple',0.5, ...
%          'StopbandAttenuation',65,'DesignMethod','kaiserwin');
% fvtool(lpFilt)
% 
