clear; close all;
% Matlab Assignment part 1 
% Andrew Munro-West 18363572
% 
% %  part 1
% Download the “dft.wav” file from the course website, and figure out some
% information of the .wav file by using ‘wavread’ command in Matlab.
% E.g. find out the sampling rate and the length of the recording (in second); hear the
% speech by using either ‘sound’ or ‘wavplay’ command in Matlab.
% Download the data file ‘wordSample.mat’, which is part of the above speech data
% with the same sampling rate.
% 

A = load('wordsample.mat');
[y,Fs] = audioread('dft.wav');

% sound(y,Fs);
% 
% Linear predictive coding (LPC) speech coding, using the data in ‘wordSample.mat’.
% Implement the linear predictive coding (LPC) similar to LPC-10 (find AR Model
% from speech signal using the Levinson-Durbin algorithm) or you can use ‘lpc’
% command in Matlab directly.
% Use LPC to analyze the real speech signals: divide the data into segments first, then
% apply the LPC to see the results, discuss the effects of the order in the AR models (e.g.
% order=12, 16, 20). 
N = Fs*22.5/1000; %length of each segment
N = round(N);
hold on
for n = 1:24
    plot([((n-1)*N)+1:n*N],A.yy(((n-1)*N)+1:n*N),'b')
    [a,g] = lpc(A.yy(((n-1)*N)+1:n*N),12);
    est_x = filter([0 -a(2:end)],1,A.yy(((n-1)*N)+1:n*N));
    plot([((n-1)*N)+1:n*N],est_x(1:N),'r--')
    plot([((n-1)*N)+1:n*N],abs((A.yy(((n-1)*N)+1:n*N)-est_x(1:N))),'c-.')
    xline(n*N);
    error_12(n,:) = abs((A.yy(((n-1)*N)+1:n*N)-est_x(1:N)));
end
hold off 
xlabel('Sample Number')
ylabel('Amplitude')
legend('Original signal','LPC estimate','Error signal')
title('12th order LPC')
% xlim([4000 4500])

figure
hold on
for n = 1:24
    plot([((n-1)*N)+1:n*N],A.yy(((n-1)*N)+1:n*N),'b')
    [a,g] = lpc(A.yy(((n-1)*N)+1:n*N),16);
    est_x = filter([0 -a(2:end)],1,A.yy(((n-1)*N)+1:n*N));
    plot([((n-1)*N)+1:n*N],est_x(1:N),'r--')
    plot([((n-1)*N)+1:n*N],abs((A.yy(((n-1)*N)+1:n*N)-est_x(1:N))),'c-.')
    xline(n*N); 
    error_16(n,:) = abs((A.yy(((n-1)*N)+1:n*N)-est_x(1:N)));
end
hold off 
xlabel('Sample Number')
ylabel('Amplitude')
legend('Original signal','LPC estimate','Error signal')
title('16th order LPC')
% xlim([4000 4500])

figure
hold on
for n = 1:24
    plot([((n-1)*N)+1:n*N],A.yy(((n-1)*N)+1:n*N),'b')    
    [a,g] = lpc(A.yy(((n-1)*N)+1:n*N),20);
    est_x = filter([0 -a(2:end)],1,A.yy(((n-1)*N)+1:n*N));
    plot([((n-1)*N)+1:n*N],est_x(1:N),'r--')
    plot([((n-1)*N)+1:n*N],abs((A.yy(((n-1)*N)+1:n*N)-est_x(1:N))),'c-.')
    xline(n*N);
    error_20(n,:) = abs((A.yy(((n-1)*N)+1:n*N)-est_x(1:N)));
end
hold off 
xlabel('Sample Number')
ylabel('Amplitude')
legend('Original signal','LPC estimate','Error signal')
title('20th order LPC')
% xlim([4000 4500])

figure
hold on
for n = 1:24
    
    plot([((n-1)*N)+1:n*N], error_12(n,:),'r')
    plot([((n-1)*N)+1:n*N], error_16(n,:),'b')
    plot([((n-1)*N)+1:n*N], error_20(n,:),'g')
    xline(n*N);
end
hold off 
xlabel('Sample Number')
ylabel('Amplitude')
legend('Error signal 12','Error signal 16','Error signal 20')
title('Error of LPC reconstructions of orders 12,16 and 20')

% 
% %audio part
% for n = 1:221
%     [a,g] = lpc(y(((n-1)*N)+1:n*N),12);
%     est_x(((n-1)*N)+1:n*N) = filter([0 -a(2:end)],1,y(((n-1)*N)+1:n*N));
% end
% sound(est_x,Fs);
