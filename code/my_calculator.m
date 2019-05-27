function output = my_calculator(BW)
%in this function, you should finish the character recognition task.
%the input parameter is a matrix of an image which contains several expressions
%the output parameter is a matrix of an image which contains the results of expressions 

%cut every line of image & save to local for future Recongnition.(in '../asset/image/cut/')
fprintf('Try cutting all equation from image...\n');
cutImg(BW);
fprintf('Cut all equation from image and save to local successfully.\n');

fprintf('Try cutting all lines in into single character...\n');
for i=1:30
	cutLine(i);
end
fprintf('Cut all lines in into single character and save to local successfully.\n');