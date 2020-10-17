clc
clear 
close all

% Read Image 
img = imread('Lenna.png');

img = rgb2gray(img);                    %change rgb image to grayscale
img = imresize(img,[128 128]);

% Frequency Domain
IMG = fft2(img);                
U = ones(size(IMG));
for i = 1:size(U,1)
    for j = 1:size(U,2)
        U(i,j) = (-1)^(i+j);
    end
end
IMG = IMG.*U;

%% Add Periodic Noise to image

[M,N] = size(IMG);
[x,y] = meshgrid(1:M,1:N);

a = 0.7;

% Create Periodic Noise
PN = a*255*(sin(1.8*x+1.8*y)+sin(x+y)+sin(2.2*x+2.2*y)+...
     sin(1.8*x-1.8*y)+sin(x-y)+sin(20.2*x-20.2*y));

% Add noise to main image
Noisy_IMG = IMG + PN;

%% Display Images

figure(1)
subplot(1,2,1);
imshow(abs(IMG)/max(max(abs(IMG)))*255);
title('Main Image FFT');
subplot(1,2,2);
imshow(abs(Noisy_IMG)/max(max(abs(Noisy_IMG)))*255);
title('Noisy Image FFT');


