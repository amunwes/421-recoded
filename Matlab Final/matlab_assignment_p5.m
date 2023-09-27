clear; close all;
% Matlab Assignment part 5 
% Andrew Munro-West 18363572
% 
% %  part 5

% 5. (Image	Denoising)	Go	to	the	course	website	and	download	a	512x512	grayscale	
% image	‘boat1.tiff’,	which	is	corrupted	by	a	Gaussian	noise	of	zero	mean	and	
% variance	1000.		Read	the	image	into	MATLAB.	Write	a	Matlab	function	to	remove	
% the	noise	as	much	as	you	can.	
% Note: The	original	clean	image	“boat.tiff”	is	also	provided	for	you	to	compare	your	
% results	with	the	clean	image.


% figure
A = imread('boat.tif'); %reads an image from a graphics file
% imshow(A)

figure
N = imread('boat1.tiff'); %reads an image from a graphics file
imshow(N)
title('Original')

figure
B = imgaussfilt(N,1);
E = imgaussfilt(N,2);
imshow(B)
figure
H = fspecial('laplacian',1);
C = imfilter(N,H);
D = imfilter(B,H);

% C = imfilter(B,H);
montage(D)
figure
imshow(E+D*0.1)
title('denoised image')
% 
% figure
% medfil = medfilt2(N);
% b = imsharpen(medfil);
% medfil = medfilt2(b);
% b = imsharpen(medfil);
% medfil = medfilt2(b);
% b = imsharpen(medfil);
% 
% imshow(b)

% figure
% B = imgaussfilt(N,2);
% imshow(B)
% figure
% figure 
% denoisedImage = conv2(double(N), ones(3)/9, 'same');
% imshow(uint8(denoisedImage))
% 
% figure 
%  denoisedImage = conv2(double(N), [0 1 0;1 4 1; 0 1 0]/8, 'same');
% imshow(uint8(denoisedImage))

% figure
% K = wiener2(N,[5 5]);
% imshow(K)
% 
% figure
% h = ones(3);
% geo_mean = imfilter(log(double(N)), h, 'replicate');
% geo_mean = exp(geo_mean);
% geo_mean = geo_mean .^ (1/numel(h));
% imshow(geo_mean, [])
% % 
% figure
% H = fspecial('average',3);
% a = imfilter(N, H);
% imshow(a)
% 
% figure 
% denoisedImage = conv2(double(denoisedImage), [0 1 0;1 4 1; 0 1 0]/8, 'same');
% 
% denoisedImage = conv2(double(denoisedImage), [0 1 0;1 4 1; 0 1 0]/8, 'same');
% 
% denoisedImage = conv2(double(denoisedImage), [0 1 0;1 4 1; 0 1 0]/8, 'same');
% 
% denoisedImage = conv2(double(denoisedImage), [0 1 0;1 4 1; 0 1 0]/8, 'same');
% 
% 
% denoisedImage = conv2(double(denoisedImage), [0 1 0;1 4 1; 0 1 0]/8, 'same');
% imshow(uint8(denoisedImage))