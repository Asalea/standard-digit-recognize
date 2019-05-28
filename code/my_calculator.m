function output = my_calculator(imgInput)
%in this function, you should finish the character recognition task.
%the input parameter is a matrix of an image which contains several expressions
%the output parameter is a matrix of an image which contains the results of expressions 

%preprocess image.
fprintf('Preprocessing image...\n');
imgInput = rgb2gray(imgInput);
threshold = graythresh(imgInput);
BW = ~im2bw(imgInput, threshold);
%figure, imshow(BW);

%delete connect-component containing pixels less than 30, in order to reduce noise.
BW = bwareaopen(BW, 30);
%figure, imshow(BW);
fprintf('Preprocess image successfully!\n\n');

%delete all border in img for OCR detection.
fprintf('Deleting all border...\n');
L = bwlabel(BW);
[r, c] = find(L==1);
rsz = size(r);
rc = [r c];
for i=1:rsz
	row = rc(i,1);
	col = rc(i,2);
	BW(row, col) = 0;
end
fprintf('Delete all border successfully!\n\n');
%figure, imshow(BW);

%cut every line of image & save them to local for future Recongnition.(in '../asset/image/cut/')

fprintf('Try cutting all equation from image...\n');
cutImg(BW);
fprintf('Cut all equation from image and save to local successfully.\n\n');

fprintf('Try cutting all lines in into single character...\n');
for i=1:30
	cutLine(i);
end
fprintf('Cut all lines in into single character and save to local successfully.\n\n');


%read number and character img, then calculate result.
rAddress = '../asset/image/cut/part';

%calculate location of all results.
fprintf('Calculating location of all results...\n');
position = cell(1, 30); 
XLen = 329; YLen = 93;
X = 253; Y = 4;

cnt = 1;
for i=1:10
	for j=1:3
		position{1, cnt}=[X+(j-1)*XLen, Y+(floor(i-1))*YLen];
		cnt = cnt +1;
	end
end
fprintf('Calculate location of all results successfully!\n\n');

fprintf('Recongning character and calculating...\n');
newimg = imgInput;
for i=1:30
	dirname = strcat(num2str(i), '/');
	dirAddress = strcat(rAddress, dirname);

	cImg0 = imread(strcat(dirAddress, '0.bmp'));
	cImg1 = imread(strcat(dirAddress, '1.bmp'));
	cImg2 = imread(strcat(dirAddress, '2.bmp'));

	d0 = str2num(my_digit(cImg0));
	c1 = my_operator(cImg1);
	d2 = str2num(my_digit(cImg2));

	if strcmp(c1, '-')
		res = d0 - d2;
	else
		res= d0 + d2;
	end
	%fprintf('In part %d: %d %c %d = %d\n', i, d0, c1, d2, res);
	newimg = insertText(newimg, position{1, i}, res, 'FontSize', 50, 'BoxColor', 'w', 'BoxOpacity', 0);
end
fprintf('Finish all works!.\n');
%figure, imshow(newimg);
output = newimg;
