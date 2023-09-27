clear; close all;
% Assignment 3 q3
% Andrew Munro-West 18363572
% 
% Problem 3: Integer filters
% 

Rest = [1 0.83 0.47 0.08 -0.22 -0.37 -0.39 -0.26];
Fatigue = [1 0.9 0.66 0.36 0.07 -0.17 -0.32 -0.37];

Rest = toeplitz(Rest);
Fatigue = toeplitz(Fatigue);

%AR(3) models
%solve for coefficients
a_Rest3 = inv(Rest(2:4,2:4))*-Rest(2:4,1)
omega_Rest3 = Rest(1,1:4)*[1;a_Rest3]
[H,F] = freqz(omega_Rest3,[1;a_Rest3]); % frequency domain magnitude response
plot(F/pi,20*log10((abs(H).^2)))  % plot w=0 to 2=pi of omega^2*|H(w)|^2
xlabel('Normalized Frequency (\times \pi rad/sample)) ')
ylabel('Magnitude(dB)')

figure
a_Fatigue3 = inv(Fatigue(2:4,2:4))*-Fatigue(2:4,1)
omega_Fatigue3 = Fatigue(1,1:4)*[1;a_Fatigue3]
[H,F] = freqz(omega_Fatigue3,[1;a_Fatigue3]); % frequency domain magnitude response
plot(F/pi,20*log10((abs(H).^2)))  % plot w=0 to 2=pi of omega^2*|H(w)|^2
xlabel('Normalized Frequency (\times \pi rad/sample)) ')
ylabel('Magnitude(dB)')
% 
% %AR(4) models
figure
a_Rest4 = inv(Rest(2:5,2:5))*-Rest(2:5,1)
omega_Rest4 = Rest(1,1:5)*[1;a_Rest4]
[H,F] = freqz(omega_Rest4,[1;a_Rest4]); % frequency domain magnitude response
plot(F/pi,20*log10((abs(H).^2)))  % plot w=0 to 2=pi of omega^2*|H(w)|^2
xlabel('Normalized Frequency (\times \pi rad/sample)) ')
ylabel('Magnitude(dB)')

figure
a_Fatigue4 = inv(Fatigue(2:5,2:5))*-Fatigue(2:5,1)
omega_Fatigue4 = Fatigue(1,1:5)*[1;a_Fatigue4]
[H,F] = freqz(omega_Fatigue4,[1;a_Fatigue4]); % frequency domain magnitude response
plot(F/pi,20*log10((abs(H).^2)))  % plot w=0 to 2=pi of omega^2*|H(w)|^2
xlabel('Normalized Frequency (\times \pi rad/sample)) ')
ylabel('Magnitude(dB)')



%b) calculate the AR(2) parameters do the changes qualitatively reflect the
%expected changes in the power spectrum?

%AR(3) models
%solve for coefficients
figure
a_Rest2 = inv(Rest(2:3,2:3))*-Rest(2:3,1)
omega_Rest2 = Rest(1,1:3)*[1;a_Rest2]
[H,F] = freqz(omega_Rest2,[1;a_Rest2]); % frequency domain magnitude response
plot(F/pi,20*log10((abs(H).^2)))  % plot w=0 to 2=pi of omega^2*|H(w)|^2
xlabel('Normalized Frequency (\times \pi rad/sample)) ')
ylabel('Magnitude(dB)')%AR(2) models
%solve for coefficients

figure
a_Fatigue2 = inv(Fatigue(2:3,2:3))*-Fatigue(2:3,1)
omega_Fatigue2 = Fatigue(1,1:3)*[1;a_Fatigue2]
[H,F] = freqz(omega_Fatigue2,[1;a_Fatigue2]); % frequency domain magnitude response
plot(F/pi,20*log10((abs(H).^2)))  % plot w=0 to 2=pi of omega^2*|H(w)|^2
xlabel('Normalized Frequency (\times \pi rad/sample)) ')
ylabel('Magnitude(dB)')



