function output=cutLine(imgLine)
[L, num] = bwlabel(imgLine);
[m, n] = size(imgLine);
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
end