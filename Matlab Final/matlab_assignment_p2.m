clear; close all;
% Matlab Assignment part 2 
% Andrew Munro-West 18363572
% 
% %  part 2

% 2.	Be	familiar	with	basic	image	analysis	functions	in	Matlab	Image	Processing	
% Toolbox	(you	can	use	“help	images”	in	Matlab).	Examples:
% • Read and display an	image:	imread(.);	imshow(.)
% • Image types	and	type conversions:	e.g.,	rgb2gray(.)
% • Color space	conversions:	e.g.,	rgb2ycbcr(.),	rgb2ntsc(.)
% • Image spatial	transformations: e.g., imresize(.), imrotate(.), imcrop(.)
% • Image transforms: DCT, Basic DWT (discrete	Wavelet	transform)
% 
% 

A = imread('children.jpg'); %reads an image from a graphics file
B = rgb2gray(A);% converts rgb image into greyscale
C = rgb2ycbcr(A);
D = rgb2ntsc(A);
E = imresize(A,0.1);
F = imrotate(A,45);
% G = imcrop(A)

H = dct2(B);

montage({A,B,C,D})
title('original(top left), greyscale(top right), YCrCb(bottom left), NTSC(bottom right)')
% imshow(A)
% figure
% % imshow(G)

% imshow(log(abs(H)),[])
% colormap parula
% colorbar
% H(abs(H)<10) = 0;

% I = idct2(H);
% I = rescale(I);
% 
% montage({B,I})
% title('Original Grayscale Image (Left) and Processed Image (Right)');

% figure
% [cA,cH,cV,cD] = dwt2(B,'sym4','mode','per');
% imagesc(cA)
% colormap(gray);
% title('Approximation Coefficients')
