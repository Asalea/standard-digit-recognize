function output = my_digit(input_image)
%in this function, you should finish the digit recognition task.
%the input parameter is a matrix of an image which contains a digit.
%the output parameter represents which digit it is.

%ocrResults = ocr(input_image, 'CharacterSet', '0123456789', 'TextLayout', 'Line');
%figure, imshow(input_image);
%output = ocrResults.Text;

templeAddress = '../asset/image/template/';
%read template img.
%Of course we can read templates in preprocess, 
%but for independent test, we load them in function, which may cause bad performance.
t = cell(10);
t{1, 1} = imread([templeAddress, '0.bmp']);
t{1, 2} = imread([templeAddress, '1.bmp']);
t{1, 3} = imread([templeAddress, '2.bmp']);
t{1, 4} = imread([templeAddress, '3.bmp']);
t{1, 5} = imread([templeAddress, '4.bmp']);
t{1, 6} = imread([templeAddress, '5.bmp']);
t{1, 7} = imread([templeAddress, '6.bmp']);
t{1, 8} = imread([templeAddress, '7.bmp']);
t{1, 9} = imread([templeAddress, '8.bmp']);
t{1, 10} = imread([templeAddress, '9.bmp']);

rmax = -1;	%r ranges [0,1]
rmax_i = -1;
for i=1:10
	r = cmpMatrix(input_image, t{1, i});
	if r > rmax
		rmax = r;
		rmax_i = i;
	end
end
output = num2str(rmax_i-1);