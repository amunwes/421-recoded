clear; close all;
% Assignment 3 q2
% Andrew Munro-West 18363572
% 
% Problem 2: Design an FIR low pass filter with specifications

% L=30;
% wm= 0.63; 
% b = fir1(30,wm,'low');
% freqz(b,1)

fcuts = [0.63 0.65];
mags = [1 0];
devs = [0.02 0.15];
[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs);
hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');

[H,f] = freqz(hh,1,1024);
plot(f/pi,abs(H))
xlabel('Normalized Frequency (x \pi rad/sample))')
ylabel('Magnitude')
grid
