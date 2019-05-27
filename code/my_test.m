%DIP19 Assignment 3
%Character Recongnition

clc; clear all;
imgInput = imread('../asset/image/test1.jpg');
imgInput = rgb2gray(imgInput);

figure, imshow(imgInput);

BW = imbinarize(imgInput);
BW1 = imdilate(BW, strel('disk', 6));
s = regionprops(BW1, 'BoundingBox');
bboxes = vertcat(s(:),.BoundingBox);

[~,ord] = sort(bboxes(:,2));
bboxes = bboxes(ord, :);

BW = imdilate(BW, strel('disk', 1));

ocrResults = ocr(BW, bboxes, 'CharacterSet', '012345678+-*/=', 'TextLayout', 'Word');
words = {ocrResults(:).Text};
words = deblank(words)

<<<<<<< HEAD
%imgInput = imresize(imgInput, 0.5);
%figure, imshow(imgInput);

%ocrResults = ocr(imgInput, 'CharacterSet', '0123456789+-*/=');
%Iocr = insertObjectAnnotation(imgInput, 'rectangle', ocrResults.WordBoundingBoxes, ocrResults.WordConfidences);
%figure; imshow(Iocr);
%ocrResults.Text
=======
BW = imbinarize(imgInput);

>>>>>>> parent of 500c49f... Update my_test.m

results=ocr(imgInput, 'TextLayout', 'Block');
results.Text

% imgOutput = my_calculator(imgInput);
%imgOutput = imgInput;

%subplot(1, 2, 1);
%imshow(imgInput);
%subplot(1, 2, 2);
%imshow(imgOutput);