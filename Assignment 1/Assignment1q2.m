clear; close all;
% Assignment 1 q2
% Andrew Munro-West 18363572
% 
% (a) Plot the second EEG node, plot the data.

A = importdata('normalData.mat');
B = importdata('pdData.mat');
len = size(A.data,2);
wid = size(A.data,1);

figure
plot([1:1:len],A.data(2,1:len))
xlim([1,len])
title('Data for node 2 in normal subject')
ylabel('Reading')
xlabel('Sample (n)')
% 
% (b) Separate the data into the rest part and the squeezing part based on the vector ampVec.
% squeeze = A.data.*A.ampVec;
% rest = A.data.*~A.ampVec;
squeeze = A.data(:,~~A.ampVec);
squeezeP = B.data(:,~~B.ampVec);
rest = A.data(:,~A.ampVec);
restP = B.data(:,~B.ampVec);
sl = size(squeeze,2);
rl = size(rest,2);

figure
tiledlayout(2,1)

ax1 = nexttile;
plot(ax1,[1:1:sl],squeeze(1,1:sl))
title(ax1,'squeeze data')
ylabel(ax1,'Reading')
xlabel(ax1,'sample(n)')
xlim([1,sl])
ax2 = nexttile;
plot(ax2,[1:1:rl],rest(1,1:rl))
xlim([1,rl])
title(ax2,'rest data')
ylabel(ax2,'Reading')
xlabel(ax2,'sample(n)')



% (c) Based on the EEG data of the ‘rest’ state, calculate the covariance matrix C_r; Based on the EEG data of the ‘squeezing’ state, calculate the covariance matrix C_s.
squeeze = transpose(squeeze);
squeezeP =transpose(squeezeP);
rest = transpose(rest);
restP = transpose(restP);

C_r = cov(rest);
C_s = cov(squeeze);
C_rp = cov(restP);
C_sp = cov(squeezeP);

% (d) Based on the EEG data of the ‘rest’ state, calculate the matrix R of correlation coefficients, and comment on the dependencies between the EEG nodes. (You can use ‘mesh’ commend to display the matrix R.) Compare the differences between the Pakinson’s disease subject the normal subject (e.g. based on features such as the eigenvalues of R; For each EEG node k, calculate the summation of R(k,j) over j and use such summations as features for comparison) and comment on your results.
R_rest = corrcoef(rest);
R_restP = corrcoef(restP);
e_rest = transpose(eig(R_rest));
e_restP = transpose(eig(R_restP));
s_rest = sum(R_rest);
s_restP = sum(R_restP);

figure
tiledlayout(2,1)
ax1 = nexttile;
mesh(ax1,R_rest)
title(ax1,'Correlation of normal rest data')

ax2 = nexttile;
mesh(ax2,R_restP)
title(ax2,'Correlation of parkinsons disease rest data')

% (e) Repeat (d) for the ‘squeezing’ state.
R_squeeze = corrcoef(squeeze);
R_squeezeP = corrcoef(squeezeP);
e_squeeze = transpose(eig(R_squeeze));
e_squeezeP = transpose(eig(R_squeezeP));
s_squeeze = sum(R_squeeze);
s_squeezeP = sum(R_squeezeP);

figure
tiledlayout(2,1)
ax1 = nexttile;
mesh(ax1,R_rest)
title(ax1,'Correlation of normal squeeze data')

ax2 = nexttile;
mesh(ax2,R_restP)
title(ax2,'Correlation of parkinsons disease squeeze data')
