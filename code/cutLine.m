function output=cutLine(imgNum)

%read line img from local.
imgName = strcat(num2str(imgNum), '.bmp');
lineAddress = strcat('../asset/image/cut/', imgName);
imgLine = imread(lineAddress);
%figure, imshow(imgLine);

%dir cut/part* wont exist, cause the cut dir has been rebuilt in function cutImg.
dirname = strcat('part', num2str(imgNum));
dirAddress = strcat('../asset/image/cut/', dirname);
dirAddress = strcat(dirAddress, '/');
mkdir(dirAddress);

[L, num] = bwlabel(imgLine);
[m, n] = size(imgLine);

nameNum = 0;
for i=1:num-2
	[r,c]=find(L==i);

	%get the width and height of each character.
	rmax = max(r);
	rmin = min(r);
	cmax = max(c);
	cmin = min(c);
	height = rmax - rmin;
	width = cmax - cmin;

	imgCharacter = imcrop(imgLine, [cmin-10, rmin-10, width+20, height+20]);
	imgCharacter = imresize(imgCharacter, [55 55]);
    %figure, imshow(imgLine);
	%figure, imshow(imgCharacter);


	%write one character to bmp file.
	address = strcat(dirAddress, num2str(nameNum));
	address = strcat(address, '.bmp');
	imwrite(imgCharacter, address);
	nameNum = nameNum+1;
end

