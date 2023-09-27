clear; close all;
% Matlab Assignment part 4 
% Andrew Munro-West 18363572
% 
% %  part 4

% (Digital	halftoning)	Go	to	the	course	website	and	download	a	512x512	
% grayscale image	‘lena.bmp’.		Read	the	image	into	MATLAB.	Write	a	Matlab	
% function	to	generate	a	“continuous-tone	gray-scale”	binary	image	by	selecting	
% one	error-diffusion	halftoning	method	and	appropriate	parameters.	Please	note	
% that	you	are	allowed	only	one	bit for	each	pixel.	Save	the	binary	image,	and	
% discuss	your	result.	
% Note: You	are	required	to	write	YOUR	OWN	codes. Do	not	call	Matlab’s	built-in	dither
% functions,	 though	 you	 might	 use	 those	 as	 benchmarks	 to	 test	 and	 compare	 the	
% results	of	your	own	codes.	Simply	copying	or	modifying	codes	found	on	the	Internet	
% is	also	not	allowed.	
% 
A = imread('lenna.bmp');


B = halftoning(A,'FloydSteinburg');
C = halftoning(A,'Jarvis');
D = halftoning(A,'Stucki');
figure
imshow(A)
title('original')
figure
imshow(B)
title('Floyd-Steinburg variation method')
figure
imshow(C)
title('Jarvis method')
figure
imshow(D)
title('Stucki method')
figure
montage({A,B,C,D})