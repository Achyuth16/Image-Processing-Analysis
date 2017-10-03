%% task1
clc;
clear all;
close all;
x=[1 1 1 1;1 1 1 1;1 1 1 1;1 1 1 1]; % input signal
h=[1 2 3 4;5 6 7 8];  %impulse response
A=flipud(conv2(x,h));% convolution of input and impulse signals and flip up to down 
f=filter2(h,x);      %fitering impulse with input 
I=mat2gray(A);        % converting the matrix to gray scale to get monochrome image
figure
imshow(I,[0 1]);    % showing as image 
figure
imshow(ones(16,1)*(0:1/15:1)); % showing the image of input matrix with scaling
figure,
load mandrill;        % loading the inbuilt image
imshow(X,map);        % showing the indexed color image 
I1=ind2gray(X,map);   % coverting the index to gray to get monochrome image 
figure
imshow(I1)
colormap('gray')