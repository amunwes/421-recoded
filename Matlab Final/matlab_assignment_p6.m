clear; close all;
% Matlab Assignment part 6  
% Andrew Munro-West 18363572
% 
% %  part 6

% 6. (Basic	DDT/JPEG	Analysis)	For	the	gray	image	‘lenna.bmp’,	


% (a) Based	on	the	original	pixel	domain	image,	display	a	histogram	for	the	image.


A = imread('lenna.bmp'); %reads an image from a graphics file
imshow(A) %displays the image read into memory

imhist(A)
title('Histogram of lenna.bmp')
xlabel('Range of values')
ylabel('Number of values in range')
yticks(0:250:3500)
xticks(0:25:250)
grid

% (b) Divide	the	image	into	8-by-8	blocks,	for	each	block,	compute the	2D	DCT.	
% Study	the	histograms	of	the	corresponding	DCT	coefficients,	and	comment	on	
% your	results.	
figure
B = mat2cell(A,ones(1,64)*8,ones(1,64)*8);
% 
for n = 1:4096
    x(:,:,n) = dct2(double(B{n}));
end
histogram(x)
title({'Histogram of all coefficients of','8x8 DCT for lenna.bmp'})
xlabel('Range of values')
ylabel('Number of values in range')
grid

% 
% k = randi([1 4050],1,5);
% for m = 1:3
%     figure
%     sgtitle({'Histograms of DCT ','coefficients for randomly selected blocks'})
%     for n = 1:49
%         subplot(7,7,n)
%         histogram(x(:,:,m+n))
%     end
%     
% end
%   


% (c) Reconstruct	the	image	from	using	only	2,	4	and	8	largest	(in	terms	of	
% magnitude)	DCT coefficients	in	each	block	(the	rest	is	simply	set	to	zero).	
% Display and	compare	the	reconstructed	image,	and	compare	the	image	
% quality	by	calculating	the	peak	signal-to-noise	ratio	(PSNR)	with	respect	to	
% the	original	image.
% 
% 
% %top 2
figure
for n = 1:4096
    temp(:,:) = x(:,:,n);
    [Y, idx] = sort(temp(:), 'descend');
    temp(idx(3:end)) = 0;
    C{n} = idct2(temp(:,:));
end
C = reshape(C,[64,64]);
C = uint8(cell2mat(C));
C_peaksnr = psnr(C,A)
imshow(C)
title({'only top 2',sprintf('PSNR = %f', C_peaksnr)})

% %top 4
figure
for n = 1:4096
    temp(:,:) = x(:,:,n);
    [Y, idx] = sort(temp(:), 'descend');
    temp(idx(5:end)) = 0;
    D{n} = idct2(temp(:,:));
end
D = reshape(D,[64,64]);
D = uint8(cell2mat(D));
D_peaksnr = psnr(D,A)
imshow(D)
title({'only top 4',sprintf('PSNR = %f', D_peaksnr)})

% %top 8
figure
for n = 1:4096
    temp(:,:) = x(:,:,n);
    [Y, idx] = sort(temp(:), 'descend');
    temp(idx(9:end)) = 0;
    E{n} = idct2(temp(:,:));
end
E = reshape(E,[64,64]);
E = uint8(cell2mat(E));
E_peaksnr = psnr(E,A)
imshow(E)
title({'only top 8',sprintf('PSNR = %f', E_peaksnr)})

figure
montage({A,C,D,E})

title('original (top left), top 2(top right), top 4(bottom left) ')






