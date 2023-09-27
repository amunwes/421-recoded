
a = [0.7100; 1.6198; 0.6193];
omega = 1.4844^2;

[H,W] = freqz(omega,[1; a]);
plot(W/pi,20*log10(abs(H).^2));
% 
% [pxx,w] = periodogram()
% 
% freqz(omega,[1;a]) % frequency domain magnitude response
% % plot(F/pi,10*log10((abs(H).^2)))  % plot w=0 to 2=pi of omega^2*|H(w)|^2
% xlabel('Normalized Frequency (\times \pi rad/sample)) ')
% ylabel('Power spectrum')
