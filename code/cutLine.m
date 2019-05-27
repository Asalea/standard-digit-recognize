function output=cutLine(imgLine)
[L, num] = bwlabel(imgLine);
[m, n] = size(imgLine);

%clear dir
relative = '../asset/image/cut/part/';
if exist(relative, 'dir')
	rmdir(relative, 's');
end
mkdir(relative);

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
    %figure, imshow(imgLine);
	figure, imshow(imgCharacter);


	%write one character to bmp file.
	address = strcat(relative, num2str(nameNum));
	address = strcat(address, '.bmp');
	imwrite(imgCharacter, address);
	nameNum = nameNum+1;
end