clc
clear 
close all

% Read Image 
img = imread('Lenna.png');

img = rgb2gray(img);                    %change rgb image to grayscale
img = imresize(img,[128 128]);