clear; close all;


I = imread('boat1.tiff'); %reads an image from a graphics file

I_filtered = I - imfilter( I, fspecial('Gaussian', 500, 10000 ) ); 

J = imfilter( I, fspecial('Gaussian', 5, 1000 ) );
K = J - imfilter( J, fspecial('Gaussian', 10, 1000 ) );
H = I - imfilter( I, fspecial('Gaussian', 1000, 10 ) );


imshow(I)
figure
imshow(H)
figure
imshow(K)

