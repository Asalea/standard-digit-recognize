function output = my_operator(input_image)
%in this function, you should finish the operator recognition task.
%the input parameter is a matrix of an image which contains an operator.
%the output parameter represents which operator it is. 

templeAddress = '../asset/image/template/';
t = cell(2);
t{1, 1} = imread([templeAddress, '+.bmp']);
t{1, 2} = imread([templeAddress, '-.bmp']);

rmax = -1;	%r ranges [0,1]
rmax_i = -1;
r_plus = cmpMatrix(input_image, t{1, 1});
r_minus = cmpMatrix(input_image, t{1, 2});
if r_plus > r_minus
	res = '+';
else
	res = '-';
end
output = res;