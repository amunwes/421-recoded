clear; close all;
% Assignment 2 q1
% Andrew Munro-West 18363572
% 
% Problem 2: STFT for speech signal spectral analysis Download the “dft.wav” 
% file from the course website, and figure out some information of the .wav
% file by using ‘wavread’ command in Matlab. E.g. find out the sampling 
% rate and the length of the recording (in second); hear the speech by 
% using either ‘sound’ or ‘wavplay’ command in Matlab.

A = load('wordsample.mat');
[y,Fs] = audioread('dft.wav');
%sound(y,Fs);

% (a) Demonstrate the time and frequency domain representations of the speech signals.
% Download the data file ‘wordSample.mat’, which is part of the above speech data
% with the same sampling rate, and load it into Matlab (e.g. load wordSample.mat).
% Plot the data, plot the autocorrelation sequence.
x = 0:1/Fs:((size(y)-1)/Fs);
x2 = 0:1/Fs:((size(y)-1)*2/Fs);
figure
tiledlayout(2,1)

ax1 = nexttile;
plot(ax1,x,y)
xlabel(ax1,'time (s)')
ylabel(ax1,'data')
title(ax1,'plot of dft.wav')


ax2 = nexttile;
plot(ax2,x2,xcorr(y))
ylabel('r_y_y(l)')
title('autocorrelation of dft.wav')

% (b) Plot the STFT-based time-varying spectrum of the speech signal, using the data in
% ‘wordSample.mat’. Make the window length (i.e. the length of each segment) to be
% 22.5 milliseconds (i.e. the window length N=Fs*22.5/1000).
% 
N = Fs*22.5/1000
s = spectrogram(A.yy,N);

figure
spectrogram(A.yy,N,[],[],Fs,'yaxis')
title('spectrogram of same signal')

figure
stft(A.yy,Fs,'FFTLength',round(N));


