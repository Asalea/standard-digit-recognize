function output = my_digit(input_image)
%in this function, you should finish the digit recognition task.
%the input parameter is a matrix of an image which contains a digit.
%the output parameter represents which digit it is.
%c0 = imread('../asset/image/cut/part1/0.bmp');
%c1 = imread('../asset/image/cut/part1/1.bmp');
%c2 = imread('../asset/image/cut/part1/2.bmp');

%input_image = c2;

%input_image = imresize(input_image, 0.5);

ocrResults = ocr(input_image, 'CharacterSet', '0123456789', 'TextLayout', 'Line');
%figure, imshow(input_image);
output = ocrResults.Text;