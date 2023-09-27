clear; close all;
% Assignment 3 q1
% Andrew Munro-West 18363572
% 
% Problem 1: Design an FIR linear phase, digital filter aproximating the
% ideal frequency response H_d(w) = 1 for |w| <= pi/6 and 0 elsewhere
wm= 1/6; 
b = fir1(24,wm,'low',rectwin(25));

% (a) Determine the coefficients of a 25-tap filter based on the window
% method with a rectangular window
h_a = impz(b);

% (b) Determine and plot the magnitude and phase response of the filter
freqz(b,1)
% (c) repeat parts (a) and (b) using the Hamming window

figure
b = fir1(24,wm,'low',hamming(25));
h_c = impz(b);
freqz(b,1)
% (d) repeat parts (a) and (b) using the Bartlett window

figure
b = fir1(24,wm,'low',bartlett(25));
h_d = impz(b);
freqz(b,1)









