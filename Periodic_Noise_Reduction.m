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

