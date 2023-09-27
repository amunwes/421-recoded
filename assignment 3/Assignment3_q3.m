clear; close all;
% Assignment 3 q3
% Andrew Munro-West 18363572
% 
% Problem 3: Integer filters
% 

% ts = -1;
% z = tf('z',ts);
% sys = (1-(z^-8))/(1+(z^-2))

% part 1

b = [1 0 0 0 0 0 0 0 -1];
a = [1 0 1];


[h,f] = freqz(b,a)
freqz(b,a)
figure
plot(f/pi,abs(h))
ylabel('magnitude')
xlabel('Normalized Frequency (\times \pi rad/sample))')

% part 2

b1 = [1 0 0 0 0 0 0 0 -2 0 0 0 0 0 0 0 1];
a1 = [1 0 2 0 1];
figure

zplane(b1,a1)
title('Pole-Zero Plot')


figure
[h,f] = freqz(b1,a1)
freqz(b1,a1)
figure 
plot(f/pi,abs(h))
ylabel('magnitude')
xlabel('Normalized Frequency (\times \pi rad/sample))')


