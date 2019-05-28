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
	rmdir(resultAddress);
end
mkdir(resultAddress);

for i=1:cellsize
	imgInput = imread(imgPath{1,i});
	imgOutput = my_calculator(imgInput);
	imwrite(imgOutput, [resultAddress, num2str(i), '.jpg']);
end
%subplot(1, 2, 1);
%imshow(imgInput);
%subplot(1, 2, 2);
%imshow(imgOutput);