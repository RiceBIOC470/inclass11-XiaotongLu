% Inclass11
%GB comments
1) 100
2) 100
3) 100
4) 100
overall: 100


% You can find a multilayered .tif file with some data on stem cells here:
% https://www.dropbox.com/s/83vjkkj3np4ehu3/011917-wntDose-esi017-RI_f0016.tif?dl=0

% 1. Find out (without reading  the entire file) -  (a) the size of the image in
% x and y, (b) the number of z-slices, (c) the number of time points, and (d) the number of
% channels.
%XiaotongLu
file1='stemcell.tif';
reader=bfGetReader(file1);
%(a):
[reader.getsizeX,reader.getsizeY];
%(b£©
reader.getsizeZ;
%(c)
reader.getsizeT;
%(d)
reader.getsizeC;

% 2. Write code which reads in all the channels from the 30th time point
% and displays them as a multicolor image.
%XiaotongLu
chan=1;
time=30;
zplane=1;
iplane=reader.getIndex(zplane-1,chan-1,time-1)+1;
img1=bfGetPlane(reader,iplane);

chan2=2;
time2=30;
zplane2=1;
iplane2=reader.getIndex(zplane2-1,chan2-1,time2-1)+1;
img2=bfGetPlane(reader,iplane2);

multiimg=cat(3,imadjust(img1),imadjust(img2),zeros(size(img1)));
imshow(multiimg)

% 3. Use the images from part (2). In one of the channels, the membrane is
% prominently marked. Determine the best threshold and make a binary
% mask which marks the membranes and displays this mask. 
%Xiaotong Lu
img_bw=img1>500;
imshow(img_bw)
img_bw=img1>700;
imshow(img_bw)
img_bw=img1>900;
imshow(img_bw)
img_bw=img1>1000;
imshow(img_bw)
img_bw=img1>1100;
imshow(img_bw)
The best threshold is 1000.

% 4. Run and display both an erosion and a dilation on your mask from part
% (3) with a structuring element which is a disk of radius 3. Explain the
% results.
%Xiaotong Lu
imshow(imerode(img_bw,strel('disk',3)));
imshow(imdilate(img_bw,strel('disk',3)));

In the imerode function, the function element disk 3 means if there is a black pixel, surrounding pixels within 3 pixels and in any directions of that pixel 
will be colored by black.So if there is a black pixel in img1, everything that is wihtin 3 radius of that pixel will get a black color. So there will be a
circle with radius 3 are colored by black. So the whole img1 will be more black like being eroded.

In the imerode function, the function element disk 3 means if there is a white pixel, surrounding pixels within 3 pixels and in any directions of that pixel 
will be colored by white.So if there is a white pixel in img1, everything that is wihtin 3 radius of that pixel will get a white color. So there will be a
circle around the white pixel with radius 3 are colored by white. So the whole img1 will be more while like being enlarged.  
