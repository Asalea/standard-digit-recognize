function output = my_operator(input_image)
%in this function, you should finish the operator recognition task.
%the input parameter is a matrix of an image which contains an operator.
%the output parameter represents which operator it is. 

ocrResults = ocr(input_image, 'CharacterSet', '+-=', 'TextLayout', 'Line');
%figure, imshow(input_image);
output = ocrResults.Text;