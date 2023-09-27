clear; close all;
% Matlab Assignment part 3 
% Andrew Munro-West 18363572
% 
%  part 3
% (Color	systems)	Download	the	color	image	‘children.JPG’	from	the	course	
% website.		For	the	color	image	‘children.JPG’,	you	need	to	try	basic	image	analysis	
% functions	in	Matlab	Image	Processing	Toolbox	(you	can	use	help	images),	e.g.	
% 
% Note: For	this	assignment,	you	are	allowed	to	use	the	existing	Matlab	functions	in	
% Image	Processing	Toolbox.	



% - read	and	display	the	color	image;
A = imread('children.jpg'); %reads an image from a graphics file
imshow(A) %displays the image read into memory
C = rgb2ycbcr(A);
% D = rgb2ntsc(A);
% - plot	the	R,G,B	sub-images;


figure
[R,G,B] = imsplit(A);
montage({R,G,B},'Size',[1 3], ...
    "BackgroundColor",'w',"BorderSize",10);
title('Representation of the Red, Green, and Blue Color Channels');

allBlack = zeros(size(A,1,2),class(A));
justR = cat(3,R,allBlack,allBlack);
justG = cat(3,allBlack,G,allBlack);
justB = cat(3,allBlack,allBlack,B);

figure
montage({justR,justG,justB},'Size',[1 3], ...
    "BackgroundColor",'w',"BorderSize",10);
title('Color Representation of the Red, Green, and Blue Color Channels');

% - convert	the	RGB	color	values	to	YCbCr	color	space	and	display	them;

figure
[Y,Cb,Cr] = imsplit(C);
montage({Y,Cb,Cr},'Size',[1 3], ...
    "BackgroundColor",'w',"BorderSize",10);
title('Color Representation of the Y Cb and Cr Color Channels');

allBlack = 128 + zeros(size(A,1,2),class(A));
justY = cat(3,Y,allBlack,allBlack);
justCb = cat(3,allBlack,Cb,allBlack);
justCr = cat(3,allBlack,allBlack,Cr);

figure%broken
montage({justY,justCb,justCr},'Size',[1 3], ...
    "BackgroundColor",'w',"BorderSize",10);
title('Color Representation of the Y Cb and Cr  Color Channels');

% - convert	the	image	into	gray	image	and	display	it;
figure
F = rgb2gray(A);% converts rgb image into greyscale
imshow(F)

% - resize	the	gray	image	to	the	standard	size	512-by-512,	and	plot	the	resized	
% image.

figure 
D = imresize(F,[512 512]);
imshow(D)





