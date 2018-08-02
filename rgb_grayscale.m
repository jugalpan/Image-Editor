
Orgimg = imread('C:\Users\JUGAL\Desktop\city.jpg');
[rows,columns,rgb] = size(Orgimg);
img = zeros(rows,columns);
for i=1:1:rows
    for j=1:1:columns
        img(i,j) =(0.21*Orgimg(i,j,1))+(0.71*Orgimg(i,j,2))+(0.08*Orgimg(i,j,3));
    end
end
imshow(Orgimg);
figure, imshow(img/256);
imwrite(img/256,'pmdd.jpg');

