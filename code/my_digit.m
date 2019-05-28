function output = my_digit(input_image)
%in this function, you should finish the digit recognition task.
%the input parameter is a matrix of an image which contains a digit.
%the output parameter represents which digit it is.

ocrResults = ocr(input_image, 'CharacterSet', '0123456789', 'TextLayout', 'Line');
%figure, imshow(input_image);
output = ocrResults.Text;