%DIP19 Assignment 3
%Character Recongnition

clc; clear all;
imgInput = imread('../asset/image/test1.jpg');
imgInput = rgb2gray(imgInput);


BW = imbinarize(imgInput);


results=ocr(imgInput, 'TextLayout', 'Block');
results.Text

% imgOutput = my_calculator(imgInput);
%imgOutput = imgInput;

%subplot(1, 2, 1);
%imshow(imgInput);
%subplot(1, 2, 2);
%imshow(imgOutput);