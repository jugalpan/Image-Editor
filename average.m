img = imread('C:\Users\JUGAL\Desktop\pmdd.jpg');
[rows,columns] = size(img);
i=2; 
j=2;
mask = (1/9)*[1 1 1; 1 1 1; 1 1 1];
Newimg = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1        
        Newimg(i,j) = (img(x-1,y-1)*mask(1,1))+(img(x,y-1)*mask(2,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x,y)*mask(2,2))+(img(x+1,y)*mask(2,3))+(img(x-1,y+1)*mask(1,3))+(img(x,y+1)*mask(2,3))+(img(x+1,y+1)*mask(3,3));
        j=j+1;
    end
    i=i+1;
    j=2;
end

for x=1:1:columns
    Newimg(1,x) = img(1,x);
end

for y=2:1:rows-1
    Newimg(y,1) = img(y,1);
end

for x=1:1:columns
    Newimg(rows,x) = img(rows,x);
end

for y=2:1:rows
    Newimg(y,columns) = img(y,columns);
end

imshow(img);
figure, imshow(Newimg/256);
