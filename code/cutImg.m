function output = cutImg(BW)
%This function intends to cut all lines from original img, then save them to local.
%It requires image of fixd width and height.

nameNum = 0;
relative = '../asset/image/cut/';
if exist(relative, 'dir')
	fprintf('Direct exists! Now delete it.\n' );
	if rmdir(relative, 's');
		fprintf('Delete successfully!\n');
	else
		fprintf('Delete failed!\n');
	end
end
mkdir(relative);

[m, n]= size(BW);
X=1;Y=1;
XInc = 332;
YInc = 95;
while(Y+YInc < n)
	imgLine = imcrop(BW, [1, Y, m, YInc]);
	%figure, imshow(imgLine);
	while(X < m)
		imgCell = imcrop(imgLine, [X, 1, XInc, YInc]);
		X = X + XInc;
		%figure, imshow(imgCell);

		nameNum = nameNum + 1;
		address = strcat(relative, num2str(nameNum));
		address = strcat(address, '.bmp');

		imwrite(imgCell, address);
	end
	X=1;
	Y=Y+YInc;
end
output = 1;