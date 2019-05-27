%DIP19 Assignment 3
%Character Recongnition

clc; clear all; close all;
imgInput = imread('../asset/image/1.png');
imgInput = rgb2gray(imgInput);

%imgInput = imresize(imgInput, 0.3);

threshold = graythresh(imgInput);
BW = ~im2bw(imgInput, threshold);
%figure, imshow(BW);


BW = bwareaopen(BW, 30);
figure, imshow(BW);

%cut input image into pieces for future Recongnition.
cutImg(BW);

cut1 = imread('../asset/image/cut/12.bmp');
figure, imshow(cut1);
ocrResults = ocr(cut1, 'TextLayout', 'Block');
%Iocr = insertObjectAnnotation(cut1, 'rectangle', ocrResults.WordBoundingBoxes, ocrResults.WordConfidences);
%figure; imshow(Iocr);
ocrResults.Text

% imgOutput = my_calculator(imgInput);
%imgOutput = imgInput;

%subplot(1, 2, 1);
%imshow(imgInput);
%subplot(1, 2, 2);
%imshow(imgOutput);