% Orgimg = imread('C:\Users\JUGAL\Desktop\rgb.jpg');
% [rows,columns,rgb] = size(Orgimg);
% img = zeros(rows,columns);
% for i=1:1:rows
%     for j=1:1:columns
%         img(i,j) =(0.21*Orgimg(i,j,1))+(0.71*Orgimg(i,j,2))+(0.08*Orgimg(i,j,3));
%     end
% end
img = imread('C:\Users\JUGAL\Desktop\pmdd.jpg');
[rows,columns] = size(img);
p=0;
Newimg = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1
        mask = zeros(9,1);
        index = 1;
        for p=0:1:2
            for q=0:1:2
                mask(index)=img(x+p-1,y+q-1);
                index = index+1;
            end
        end
        med=sort(mask);
        Newimg(x,y) = med(5);
    end
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
