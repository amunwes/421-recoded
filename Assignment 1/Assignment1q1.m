clear; close all;
% Assignment 1 q1
% Andrew Munro-West 18363572
% 1. (Digital signal) Consider the following analog sinusoidal signal xa(t)=cos(2p f0 t).
% (a) Sketch (plot) the signal xa(t) for 0≤t≤20 for f0=1, 1.5, and 4 Hz respectively.

Fs = 4;
t = 0:0.001:20;ts = 0:1/Fs:25; f1 = 1; f2 = 1.5; f3 = 4;
x1= cos(2*pi*f1*t);
x2= cos(2*pi*f2*t);
x3= cos(2*pi*f3*t);
x1s= cos(2*pi*f1*ts);
x2s= cos(2*pi*f2*ts);
x3s= cos(2*pi*f3*ts);
figure
tiledlayout(3,1)

ax1 = nexttile;
plot(ax1,t,x1,ts(1,1:81),x1s(1,1:81),'r*')
title(ax1,'f0 = 1Hz plot')
ylabel(ax1,'cos(2*pi*f0*t)')
xlabel(ax1,'t(sec)')

ax3 = nexttile;
plot(ax3,t,x2,ts(1,1:81),x2s(1,1:81),'r*')
title(ax3,'f0 = 1.5Hz plot')
ylabel(ax3,'cos(2*pi*f0*t)')
xlabel(ax3,'t(sec)')

ax5 = nexttile;
plot(ax5,t,x3,ts(1,1:81),x3s(1,1:81),'r*')
title(ax5,'f0 = 4Hz plot')
ylabel(ax5,'cos(2*pi*f0*t)')
xlabel(ax5,'t(sec)')

% (b) For the sample rate Fs = 4Hz, plot the digital signal x(n) for 0≤n≤99. Explain the
% similarities and differences among the various plots (for f0=1, 1.5, and 4 Hz respectively).

figure
tiledlayout(3,1)

ax2 = nexttile;
stem(ax2,ts(1,1:100),x1s(1,1:100))
xticks(0:10/4:25)
xticklabels(0:10:100)
title(ax2,'f0 = 1Hz plot sampled at 4Hz')
ylabel(ax2,'x(n)')
xlabel(ax2,'n')

ax4 = nexttile;
stem(ax4,ts(1,1:100),x2s(1,1:100))
xticks(0:10/4:25)
xticklabels(0:10:100)
title(ax4,'f0 = 1.5Hz plot sampled at 4Hz')
ylabel(ax4,'x(n)')
xlabel(ax4,'n')

ax6 = nexttile;
stem(ax6,ts(1,1:100),x3s(1,1:100))
xticks(0:10/4:25)
xticklabels(0:10:100)
title(ax6,'f0 = 4Hz plot sampled at 4Hz')
ylabel(ax6,'x(n)')
xlabel(ax6,'n')


%same plots but only to t=2 instead of 20 for better clarity of the shape
% Fs = 4;
% t = 0:0.001:2;ts = 0:1/Fs:2; f1 = 1; f2 = 1.5; f3 = 4;
% x1= cos(2*pi*f1*t);
% x2= cos(2*pi*f2*t);
% x3= cos(2*pi*f3*t);
% x1s= cos(2*pi*f1*ts);
% x2s= cos(2*pi*f2*ts);
% x3s= cos(2*pi*f3*ts);
% figure
% tiledlayout(3,2)
% 
% ax1 = nexttile;
% plot(ax1,t,x1,ts,x1s,'r*')
% title(ax1,'f0 = 1Hz plot')
% ylabel(ax1,'cos(2*pi*f0*t)')
% 
% ax2 = nexttile;
% stem(ax2,ts,x1s,'r')
% title(ax2,'f0 = 1Hz plot sampled at 4Hz')
% ylabel(ax2,'cos(2*pi*f0*t)')
% 
% ax3 = nexttile;
% plot(ax3,t,x2,ts,x2s,'r*')
% title(ax3,'f0 = 1.5Hz plot')
% ylabel(ax3,'cos(2*pi*f0*t)')
% 
% ax4 = nexttile;
% stem(ax4,ts,x2s,'r')
% title(ax4,'f0 = 1.5Hz plot sampled at 4Hz')
% ylabel(ax4,'cos(2*pi*f0*t)')
% 
% ax5 = nexttile;
% plot(ax5,t,x3,ts,x3s,'r*')
% title(ax5,'f0 = 4Hz plot')
% ylabel(ax5,'cos(2*pi*f0*t)')
% 
% ax6 = nexttile;
% stem(ax6,ts,x3s,'r')
% title(ax6,'f0 = 4Hz plot sampled at 4Hz')
% ylabel(ax6,'cos(2*pi*f0*t)')

% (c) Suppose that f0 =5Hz and Fs=20Hz. Plot the signal x(n). What is the frequency of the
% signal x(n)?

Fs = 20;
t = 0:0.001:5;ts = 0:1/Fs:5; f1 = 5;
x1= cos(2*pi*f1*t);
x1s= cos(2*pi*f1*ts);
figure
tiledlayout(2,1)
ax1 = nexttile;
plot(ax1,t,x1,ts,x1s,'r*')
title(ax1,'f0 = 5Hz plot')
ylabel(ax1,'cos(2*pi*f0*t)')
xlabel(ax1,'t(sec)')

ax2= nexttile;
stem(ax2,ts,x1s)
xticks(0:10/Fs:5)
xticklabels(0:10:100)
title(ax2,'x(n) sampled at 20Hz')
ylabel(ax2,'x(n)')
xlabel(ax2,'n')

% % (d) Same as in (c), let y(n)=x(2n-1), i.e. by taking the even-numbered samples of x(n), is this
% % a sinusoidal signal? Why? If so, what is its frequency? 
 
% Fs = 10;
% t = 0:0.001:20;ts = 0:1/Fs:20; f1 = 5;
% x1= cos(2*pi*f1*t);
% x1s= cos(2*pi*f1*ts);
figure
tiledlayout(2,1)

ax1 = nexttile;
plot(ax1,t,x1,ts(2:2:100),x1s(2:2:100),'r*')
title(ax1,'f0 = 5Hz plot')
ylabel(ax1,'cos(2*pi*f0*t)')
xlabel(ax1,'t(sec)')

ax2= nexttile;
stem(ax2,ts(2:2:100),x1s(2:2:100))
xticks(0:10/Fs:5)
xticklabels(0:5:50)
title(ax2,'y(n) sampled at 20Hz')
ylabel(ax2,'y(n)')
xlabel(ax2,'n')
ylim(ax2,[-1,1])


