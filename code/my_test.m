%DIP19 Assignment 3
%Character Recongnition

clc; clear all; close all;
imgInput = imread('../asset/image/test4.jpg');
%imgInput = imread('../asset/image/1_part.png');
imgInput = rgb2gray(imgInput);


%imgInput = imresize(imgInput, 0.5);
figure, imshow(imgInput);

ocrResults = ocr(imgInput, 'CharacterSet', '0123456789+-*/=');
%Iocr = insertObjectAnnotation(imgInput, 'rectangle', ocrResults.WordBoundingBoxes, ocrResults.WordConfidences);
%figure; imshow(Iocr);
ocrResults.Text


% imgOutput = my_calculator(imgInput);
%imgOutput = imgInput;

%subplot(1, 2, 1);
%imshow(imgInput);
%subplot(1, 2, 2);
%imshow(imgOutput);