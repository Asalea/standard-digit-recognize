%DIP19 Assignment 3
%Character Recongnition

clc; clear all; close all;

%To add more image, please add path here.
cellsize = 6;
imgPath = cell(1, cellsize);
imgPath{1, 1}='../asset/image/1.png';
imgPath{1, 2}='../asset/image/2.png';
imgPath{1, 3}='../asset/image/3.png';
imgPath{1, 4}='../asset/image/4.png';
imgPath{1, 5}='../asset/image/5.png';
imgPath{1, 6}='../asset/image/example.png';

%clear result dir.
fprintf('Clearing result directory...\n');
resultAddress = '../asset/image/result/';
if exist(resultAddress, 'dir')
	rmdir(resultAddress, 's');
end
mkdir(resultAddress);


%display all 6 test image.
%{
for i=1:cellsize
	imgInput = imread(imgPath{1,i});
	imgOutput = my_calculator(imgInput);
	%imwrite(imgOutput, [resultAddress, num2str(i), '.jpg']);
	%subplot(1, 2, 1);
	%imshow(imgInput);
	%subplot(1, 2, 2);
	%imshow(imgOutput);
end
%}

	
%You can choose which img to test here.For example, imgnum = 2 means test '../asset/image/2.png'.
imgnum = 2;
imgInput = imread(imgPath{1,imgnum});
imgOutput = my_calculator(imgInput);
imwrite(imgOutput, [resultAddress, num2str(imgnum), '.jpg']);
subplot(1, 2, 1);
imshow(imgInput);
subplot(1, 2, 2);
imshow(imgOutput);


%Result has been output to '../asset/image/result/'