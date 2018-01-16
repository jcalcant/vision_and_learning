close all; clc; clear all;

%TASK1 GAUSSIAN FILTER
% For the given image lena_gaussian.tif, apply a Gaussian filter to eliminate the noise

% Load image of Lena
img = iread('lena_gaussian.tif');

% Show picture
idisp(img,'nogui')

%gaussian filter
K = kgauss(4); % 4 pixel std dev
cimg = iconv(K,img); %convolution of kernel K over image img
figure; idisp(cimg,'nogui')

%************************************************************************
%TASK2 MEDIAN FILTER
%Picture lena_salt_pepper.tif contains salt and pepper noise. Try to remove the noise by a Gaussian filter.
%Apply also median filter of different dimensions to eliminate the noise.

% Load image of Lena w/salt and pepper noise
img = iread('lena_salt_pepper.tif');

% Show picture
figure; idisp(img,'nogui')

%gaussian filter
K = kgauss(4); % 4 pixel std dev
cimg = iconv(K,img);
figure; idisp(cimg,'nogui')

%median filter
figure; idisp(irank(img,4,ones(3,3)),'nogui') % 3x3 kernel with median at 4

%***********************************************************************
%TASK3 EDGE DETECTION
%Determine the horizontal and vertical gradients on picture cameraman.tif and display them. Compute and show
%also the total gradient magnitude.

img = iread('cameraman.tif', 'double');
figure; idisp(img,'nogui')

K=[0.5 0 -0.5]; %gradient without smoothing
cimg=iconv(K,img);
figure; idisp(cimg,'nogui', 'invsigned')
cimg=iconv(K',img);
figure; idisp(cimg,'nogui', 'invsigned')

Iu = iconv(img,kdgauss(1.5)); %convolution of image with derivative of gaussian kernel w.r.t. u axis
Iv = iconv(img,kdgauss(1.5)'); %convolution of image with derivative of gaussian kernel w.r.t. v axis

figure; idisp(Iu, 'nogui', 'invsigned'); %
figure; idisp(Iv, 'nogui', 'invsigned'); % 

magn = sqrt(Iu.^2 + Iv.^2); %magnitude calculation
figure; idisp(magn, 'nogui'); 

th = atan2( Iv, Iu); %edge directions
figure; quiver(1:20:numcols(th), 1:20:numrows(th), Iu(1:20:end,1:20:end), Iv(1:20:end,1:20:end))

edges = icanny(img, 2); %canny operator
figure; idisp(edges, 'nogui'); 

