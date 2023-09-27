clear; close all;
% Assignment 2 q1
% Andrew Munro-West 18363572
% 
% Problem 1: DFT leakage, noisy signal, spectrum
% Note: You might want to study the reading material on Spectrum Analysing using DFT.
% Suppose the signal of interest x(t) consists of 3 sinusoid components, i.e.
% x(t) = sin(2pf1t) + sin(2pf2t) + 2 sin(2pf3t) with the three frequencies f1=5 kHz, f2=5.5
% kHz, and f3=10 kHz. Assume the sampling frequency is fs=32 kHz.
% (a) Write down x(n), and plot x(n) for n=0, 1, …, N-1, with N =32, 64, 128 respectively.
f1 = 5000; f2 = 5500; f3 = 10000;
Fs = 32000;
n = 0:1/Fs:127/Fs;
n_x = 0:1:127;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);

figure
tiledlayout(3,1)

ax1 = nexttile;
stem(ax1,n_x,x_n)
xticks(0:10:127)
%xticklabels(0:1:127)
title(ax1,'x(n) N=128')
xlim(ax1,[0,128])
ylabel(ax1,'x(n)')
xlabel(ax1,'n')

ax2 = nexttile;
stem(ax2,n_x(1:64),x_n(1:64))
xticks(0:5:63)
title(ax2,'x(n) N=64')
xlim(ax2,[0,64])
ylabel(ax2,'x(n)')
xlabel(ax2,'n')

ax3 = nexttile;
stem(ax3,n_x(1:32),x_n(1:32))
xticks(0:1:31)
title(ax3,'x(n) N=32')
xlim(ax3,[0,32])
ylabel(ax3,'x(n)')
xlabel(ax3,'n')


% (b) What is the corresponding frequency resolution? For N=32, 64, and 128, plot the
% corresponding magnitude spectrums of {x(n)}. Comment on the results.

%The frequency resolution is the sampling frequency divided by the length N
%of the FFT therefore the frequency resolutions are 1000Hz, 500Hz and 250Hz
%respectively, the magnitude spectrums are the FFT of the function.
%N_fft1 = 32; N_fft2 = 64; N_fft3 = 128;
% 
% n = 0:1/Fs:(N_fft1-1)/Fs;
% x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
% y_n = abs(fft(x_n)); % magnitude spectrum
% f = (0:N_fft1-1)*Fs/N_fft1;
figure
tiledlayout(3,1)

ax1 = nexttile;

N=32;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
y_n = abs(fft(x_n)); % magnitude spectrum
f = (0:N-1)*Fs/N;

plot(ax1,f,y_n)
xticklabels(0:5:35)
title(ax1,'magnitude spectrum N = 32 ')
ylabel(ax1,'|{x(n)}|')
xlabel(ax1,'Frequency (kHz)')

ax2 = nexttile;

N=64;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
y_n = abs(fft(x_n)); % magnitude spectrum
f = (0:N-1)*Fs/N;

plot(ax2,f,y_n)
xticklabels(0:5:35)
title(ax2,'magnitude spectrum N = 64 ')
ylabel(ax2,'|{x(n)}|')
xlabel(ax2,'Frequency (kHz)')

ax3 = nexttile;

N = 128;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
y_n = abs(fft(x_n)); % magnitude spectrum
f = (0:N-1)*Fs/N;

plot(ax3,f,y_n)
xticklabels(0:5:35)
title(ax3,'magnitude spectrum N = 128 ')
ylabel(ax3,'|{x(n)}|')
xlabel(ax3,'Frequency (kHz)')


% (c) For N=32, zero-padding {x(n)} to be with length 128 first, then plot the
% corresponding magnitude spectrum. Comment on the results when compared with
% N=128 in (b).

figure
tiledlayout(1,1)

ax1 = nexttile;

N=32;
nfft = 4*N;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
y_n = abs(fft([x_n,zeros(1,3*N)])); % magnitude spectrum
f = (0:nfft-1)*Fs/nfft;

plot(ax1,f,y_n)
xticklabels(0:5:35)
title(ax1,'magnitude spectrum N = 32 with zero padding ')
ylabel(ax1,'|{x(n)}|')
xlabel(ax1,'Frequency (kHz)')


% (d) Study the effects of Gaussian white noise (WGN). Generate a zero-mean white
% Gaussian noise sequence (use ‘randn’ in Matlab) with variance 1. For N=32, plot the
% noise sequence, the signal sequence of (a), and the result of adding the two signals.
% Repeat (a) and (b) by using the above noisy signal.

figure
tiledlayout(3,1)

ax1 = nexttile;

N=32;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
f = (0:N-1);
stem(ax1,f,x_n)
xticklabels(0:5:35)
title(ax1,'signal x(n) N = 32 ')
ylabel(ax1,'x(n)')
xlabel(ax1,'n')
xlim([0,32])

ax2 = nexttile;

noise = randn(1,4*N);
stem(ax2,f,noise(1:32),'r')
title(ax2,'gaussian noise of 0 mean and 1 variance ')
ylabel(ax2,'noise(n)')
xlabel(ax2,'n')
xlim([0,32])

ax3 = nexttile;
stem(ax3,f,x_n+noise(1:32))
title(ax3,'noisy signal x(n) ')
ylabel(ax3,'noise(n)+x(n)')
xlabel(ax3,'n')
xlim([0,32])

figure
tiledlayout(3,1)

ax1 = nexttile;

N=32;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
f = (0:N-1);

stem(ax1,f,x_n+noise(1:32))
title(ax1,'noisy signal x(n) N = 32 ')
ylabel(ax1,'noise(n)+x(n)')
xlabel(ax1,'n')
xlim([0,32])

ax2 = nexttile;

N=64;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
f = (0:N-1);

stem(ax2,f,x_n+noise(1:64))
title(ax2,'noisy signal x(n) N = 64 ')
ylabel(ax2,'noise(n)+x(n)')
xlabel(ax2,'n')
xlim([0,64])

ax3 = nexttile;

N=128;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
f = (0:N-1);

stem(ax3,f,x_n+noise(1:128))
title(ax3,'noisy signal x(n) N = 128 ')
ylabel(ax3,'noise(n)+x(n)')
xlabel(ax3,'n')
xlim([0,128])

figure
tiledlayout(3,1)

ax1 = nexttile;

N=32;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
y_n = abs(fft(x_n+noise(1:N))); % magnitude spectrum
f = (0:N-1)*Fs/N;

plot(ax1,f,y_n)
xticklabels(0:5:35)
title(ax1,'magnitude spectrum N = 32 ')
ylabel(ax1,'|{x(n)}|')
xlabel(ax1,'Frequency (kHz)')

ax2 = nexttile;

N=64;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
y_n = abs(fft(x_n+noise(1:N))); % magnitude spectrum
f = (0:N-1)*Fs/N;

plot(ax2,f,y_n)
xticklabels(0:5:35)
title(ax2,'magnitude spectrum N = 64 ')
ylabel(ax2,'|{x(n)}|')
xlabel(ax2,'Frequency (kHz)')

ax3 = nexttile;

N = 128;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
y_n = abs(fft(x_n+noise(1:N))); % magnitude spectrum
f = (0:N-1)*Fs/N;

plot(ax3,f,y_n)
xticklabels(0:5:35)
title(ax3,'magnitude spectrum N = 128 ')
ylabel(ax3,'|{x(n)}|')
xlabel(ax3,'Frequency (kHz)')


% (e) Repeat the steps in (d) but for a WGN signal of mean 1 and variance of 10.
% Comments on your results.

figure
tiledlayout(3,1)

ax1 = nexttile;

N=32;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
f = (0:N-1);
stem(ax1,f,x_n)
xticklabels(0:5:35)
title(ax1,'signal x(n) N = 32 ')
ylabel(ax1,'x(n)')
xlabel(ax1,'n')
xlim([0,32])

ax2 = nexttile;

noise1 = 10*randn(1,4*N)+1;
stem(ax2,f,noise1(1:32),'r')
title(ax2,'gaussian noise of 1 mean and 10 variance ')
ylabel(ax2,'noise(n)')
xlabel(ax2,'n')
xlim([0,32])

ax3 = nexttile;
stem(ax3,f,x_n+noise1(1:32))
title(ax3,'noisy signal x(n) ')
ylabel(ax3,'noise(n)+x(n)')
xlabel(ax3,'n')
xlim([0,32])

figure
tiledlayout(3,1)

ax1 = nexttile;

N=32;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
f = (0:N-1);

stem(ax1,f,x_n+noise1(1:32))
title(ax1,'noisy signal x(n) N = 32 ')
ylabel(ax1,'noise(n)+x(n)')
xlabel(ax1,'n')
xlim([0,32])

ax2 = nexttile;

N=64;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
f = (0:N-1);

stem(ax2,f,x_n+noise1(1:64))
title(ax2,'noisy signal x(n) N = 64 ')
ylabel(ax2,'noise(n)+x(n)')
xlabel(ax2,'n')
xlim([0,64])

ax3 = nexttile;

N=128;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
f = (0:N-1);

stem(ax3,f,x_n+noise1(1:128))
title(ax3,'noisy signal x(n) N = 128 ')
ylabel(ax3,'noise(n)+x(n)')
xlabel(ax3,'n')
xlim([0,128])

figure
tiledlayout(3,1)

ax1 = nexttile;

N=32;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
y_n = abs(fft(x_n+noise1(1:N))); % magnitude spectrum
f = (0:N-1)*Fs/N;

plot(ax1,f,y_n)
xticklabels(0:5:35)
title(ax1,'magnitude spectrum N = 32 ')
ylabel(ax1,'|{x(n)}|')
xlabel(ax1,'Frequency (kHz)')

ax2 = nexttile;

N=64;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
y_n = abs(fft(x_n+noise1(1:N))); % magnitude spectrum
f = (0:N-1)*Fs/N;

plot(ax2,f,y_n)
xticklabels(0:5:35)
title(ax2,'magnitude spectrum N = 64 ')
ylabel(ax2,'|{x(n)}|')
xlabel(ax2,'Frequency (kHz)')

ax3 = nexttile;

N = 128;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
y_n = abs(fft(x_n+noise1(1:N))); % magnitude spectrum
f = (0:N-1)*Fs/N;

plot(ax3,f,y_n)
xticklabels(0:5:35)
title(ax3,'magnitude spectrum N = 128 ')
ylabel(ax3,'|{x(n)}|')
xlabel(ax3,'Frequency (kHz)')

% (f) For the noisy signal as in (d) with N= 64 and 128, study the effects of different
% windows (e.g., Hamming, Hann and Blackman). Comments on your results. 

figure
tiledlayout(3,1)

ax1 = nexttile;

N=64;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
signal = (x_n+noise(1:N)).*transpose(hann(N));
y_n = abs(fft(signal)); % magnitude spectrum

f = (0:N-1)*Fs/N;

plot(ax1,f,y_n)
xticklabels(0:5:35)
title(ax1,'magnitude spectrum Hann windowed N = 64 ')
ylabel(ax1,'|{x(n)}|')
xlabel(ax1,'Frequency (kHz)')

ax2 = nexttile;

signal = (x_n+noise(1:N)).*transpose(hamming(N));
y_n = abs(fft(signal)); % magnitude spectrum

plot(ax2,f,y_n)
xticklabels(0:5:35)
title(ax2,'magnitude spectrum hamming windowed N = 64 ')
ylabel(ax2,'|{x(n)}|')
xlabel(ax2,'Frequency (kHz)')

ax3 = nexttile;

signal = (x_n+noise(1:N)).*transpose(blackman(N));
y_n = abs(fft(signal)); % magnitude spectrum

plot(ax3,f,y_n)
xticklabels(0:5:35)
title(ax3,'magnitude spectrum blackman windowed N = 64 ')
ylabel(ax3,'|{x(n)}|')
xlabel(ax3,'Frequency (kHz)')

figure
tiledlayout(3,1)

ax1 = nexttile;

N=128;
n = 0:1/Fs:(N-1)/Fs;
x_n = sin(2*pi*f1*n) + sin(2*pi*f2*n) + 2*sin(2*pi*f3*n);
signal = (x_n+noise(1:N)).*transpose(hann(N));
y_n = abs(fft(signal)); % magnitude spectrum

f = (0:N-1)*Fs/N;

plot(ax1,f,y_n)
xticklabels(0:5:35)
title(ax1,'magnitude spectrum Hann windowed N = 128 ')
ylabel(ax1,'|{x(n)}|')
xlabel(ax1,'Frequency (kHz)')

ax2 = nexttile;

signal = (x_n+noise(1:N)).*transpose(hamming(N));
y_n = abs(fft(signal)); % magnitude spectrum

plot(ax2,f,y_n)
xticklabels(0:5:35)
title(ax2,'magnitude spectrum hamming windowed N = 128 ')
ylabel(ax2,'|{x(n)}|')
xlabel(ax2,'Frequency (kHz)')

ax3 = nexttile;

signal = (x_n+noise(1:N)).*transpose(blackman(N));
y_n = abs(fft(signal)); % magnitude spectrum

plot(ax3,f,y_n)
xticklabels(0:5:35)
title(ax3,'magnitude spectrum blackman windowed N = 128 ')
ylabel(ax3,'|{x(n)}|')
xlabel(ax3,'Frequency (kHz)')