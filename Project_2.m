clc function varargout = Project_2(varargin)
% PROJECT_2 MATLAB code for Project_2.fig
%      PROJECT_2, by itself, creates a new PROJECT_2 or raises the existing
%      singleton*.
%
%      H = PROJECT_2 returns the handle to a new PROJECT_2 or the handle to
%      the existing singleton*.
%
%      PROJECT_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_2.M with the given input arguments.
%
%      PROJECT_2('Property','Value',...) creates a new PROJECT_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project_2

% Last Modified by GUIDE v2.5 25-Feb-2016 05:48:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Project_2 is made visible.
function Project_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project_2 (see VARARGIN)

% Choose default command line output for Project_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Robert's Operator

img = imread('Panchal.png'); % input image

[rows,columns] = size(img);
i=2; 
j=2;
Newimg = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1
        Newimg(i,j) = abs(img(x,y)-img(x+1,y)) + abs(img(x,y)-img(x,y-1));
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

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg/256);
title('Robert''s Operator');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Sobel Operator

img1 = imread('Panchal.png'); % input image

img = im2double(img1);
[rows,columns] = size(img);
mask = [1 2 1; 0 0 0; -1 -2 -1];
masky = [1 0 -1; 2 0 -2; 1 0 -1];
Newimg = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1        
        a1 = (img(x-1,y-1)*mask(1,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x+1,y)*mask(3,2))+(img(x-1,y+1)*mask(1,3))+(img(x+1,y+1)*mask(3,3));
        a2 = (img(x-1,y-1)*masky(1,1))+(img(x+1,y-1)*masky(3,1))+(img(x-1,y)*masky(1,2))+(img(x+1,y)*masky(3,2))+(img(x-1,y+1)*masky(1,3))+(img(x+1,y+1)*masky(3,3));
        Newimg(x,y) = sqrt(double(abs(a1*a1)) + double(abs(a2*a2)));
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

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg);
title('Sobel Operator');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Kirsh Operator
img1 = imread('Panchal.png'); % input image

img = im2double(img1);
[rows,columns] = size(img);

maskp1 = [-1 0 1; -1 0 1; -1 0 1];
maskp2 = [1 1 1; 0 0 0; -1 -1 -1];
maskk1 = [0 1 1; -1 0 1; -1 -1 0];
maskk2 = [1 1 0; 1 0 -1; 0 -1 -1];

Newimg = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1
        a1 = (img(x-1,y-1)*maskp1(1,1))+(img(x,y-1)*maskp1(2,1))+(img(x+1,y-1)*maskp1(3,1))+(img(x-1,y+1)*maskp1(1,3))+(img(x,y+1)*maskp1(2,3))+(img(x+1,y+1)*maskp1(3,3));
        a2 = (img(x-1,y-1)*maskp2(1,1))+(img(x+1,y-1)*maskp2(3,1))+(img(x-1,y)*maskp2(1,2))+(img(x+1,y)*maskp2(3,2))+(img(x-1,y+1)*maskp2(1,3))+(img(x+1,y+1)*maskp2(3,3));
        a3 = (img(x-1,y-1)*maskk1(1,1))+(img(x,y-1)*maskk1(2,1))+(img(x+1,y-1)*maskk1(3,1))+(img(x-1,y)*maskk1(1,2))+(img(x,y)*maskk1(2,2))+(img(x+1,y)*maskk1(3,2))+(img(x-1,y+1)*maskk1(1,3))+(img(x,y+1)*maskk1(2,3))+(img(x+1,y+1)*maskk1(3,3));
        a4 = (img(x-1,y-1)*maskk2(1,1))+(img(x,y-1)*maskk2(2,1))+(img(x+1,y-1)*maskk2(3,1))+(img(x-1,y)*maskk2(1,2))+(img(x,y)*maskk2(2,2))+(img(x+1,y)*maskk2(3,2))+(img(x-1,y+1)*maskk2(1,3))+(img(x,y+1)*maskk2(2,3))+(img(x+1,y+1)*maskk2(3,3));
        max1 = max(abs(a1),abs(a2));
        max2 = max(abs(a3),abs(a4));
        Newimg(x,y) = max(max1,max2);
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

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg);
title('Kirsh Operator');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Laplacian N8
img1 = imread('Panchal.png'); % input image

img = im2double(img1);
[rows,columns] = size(img);
mask = [1 1 1; 1 -8 1; 1 1 1];
Newimg = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1
        p1 = (img(x-1,y-1)*mask(1,1))+(img(x,y-1)*mask(2,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x,y)*mask(2,2))+(img(x+1,y)*mask(3,2))+(img(x-1,y+1)*mask(1,3))+(img(x,y+1)*mask(2,3))+(img(x+1,y+1)*mask(3,3));
        Newimg(x,y) = abs(double(p1));
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

subplot(1,2,1);
imshow(img);
title('Original image');

subplot(1,2,2);
imshow(Newimg);
title('Laplacian with 8 ');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Laplacian Visual
img1 = imread('Panchal.png'); % input image

img = im2double(img1);
[rows,columns] = size(img);
mask = [1 1 1; 1 -8 1; 1 1 1];
Newimg = zeros(rows,columns);

for x=2:1:rows-1
    for y=2:1:columns-1
        Newimg(x,y) = (img(x-1,y-1)*mask(1,1))+(img(x,y-1)*mask(2,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x,y)*mask(2,2))+(img(x+1,y)*mask(2,3))+(img(x-1,y+1)*mask(1,3))+(img(x,y+1)*mask(2,3))+(img(x+1,y+1)*mask(3,3));
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

blo = min(Newimg(:));
bhi = max(Newimg(:));

for x=2:1:rows-1
    for y=2:1:columns-1
        if(Newimg(x,y) < blo)
            Newimg(x,y) = 0;
        elseif(Newimg(x,y) >= bhi)
            Newimg(x,y) = 255;
        else
            Newimg(x,y) = (double(double(Newimg(x,y)-blo)/(bhi-blo)));
        end
    end
end

display(blo);
display(bhi);

subplot(1,2,1);
imshow(img);
title('Original image');

subplot(1,2,2);
imshow(Newimg);
title('Laplacian for Visual purpose ');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Component Labeling
img = imread('Panchal.png'); % input image

% [rows,columns,colo] = size(Orgimg);
% img = zeros(rows,columns);
% for i=1:1:rows
%     for j=1:1:columns
%         img(i,j) =(0.21*Orgimg(i,j,1))+(0.71*Orgimg(i,j,2))+(0.08*Orgimg(i,j,3));
%     end
% end
%  img = imread('Panchal.png'); % input image

[rows,columns] = size(img);
T=200;
Newimg = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1
        if(img(x,y) < T)
            Newimg(x,y) = 0;
        else
            Newimg(x,y) = 255;
        end
    end
end
subplot(1,3,1);
imshow(img);
% imshow(Orgimg);
title('Original Image');

subplot(1,3,2);
imshow(Newimg/256);
title('B/W Image');

lab = 253;
for x=2:1:rows-1
    for y=2:1:columns-1
        if(Newimg(x,y) == 255)
            if(Newimg(x-1,y) == 0 && Newimg(x,y-1) == 0)
               Newimg(x,y) = lab;
               lab = lab - 1;
            
            elseif(Newimg(x-1,y) == 0 || Newimg(x,y-1) == 0)
                    if(Newimg(x,y-1)==0)
                        Newimg(x,y) = Newimg(x-1,y);
                    else
                        Newimg(x,y) = Newimg(x,y-1);
                    end
            else
                for p=2:1:rows-1
                    for q=2:1:columns-1
                        if(Newimg(p,q)==Newimg(x-1,y)||Newimg(p,q)==Newimg(x,y-1))
                            Newimg(p,q) = Newimg(x,y-1);
                        end
                    end
                end
            end
            for p=2:1:rows-1
                for q=2:1:columns-1 
                    if (Newimg(p,q) ~= 0 && Newimg(p,q-1) == Newimg(p-1,q))
                        if (Newimg(p,q-1) ~= 0 && Newimg(p-1,q) ~= 0)
                            Newimg(p,q) = Newimg(p-1,q);
                        end
                    end
                end
            end
        end
    end
end

subplot(1,3,3);
imshow(Newimg/256);
title('Component Mapped');

H = zeros(255,1);
for i = 1:1:x
    for j = 1:1:y
            H((Newimg(i,j)+1),1) = H((Newimg(i,j)+1),1) + 1;
    end
end
sum = 0;
count = 0;
for p = 2:1:255
    if H(p,1) ~= 0
        disp(H(p,1));
        sum = sum + H(p,1);
        count = count + 1;
    end
end

set(handles.text7, 'String', num2str(count));
set(handles.text9, 'String', num2str(sum));

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% average 3x3 mask
img = imread('Panchal.png'); % input image

[rows,columns] = size(img);
i=2; 
j=2;
mask = (1/9)*[1 1 1; 1 1 1; 1 1 1];
Newimg = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1        
        Newimg(i,j) = (img(x-1,y-1)*mask(1,1))+(img(x,y-1)*mask(2,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x,y)*mask(2,2))+(img(x+1,y)*mask(3,2))+(img(x-1,y+1)*mask(1,3))+(img(x,y+1)*mask(2,3))+(img(x+1,y+1)*mask(3,3));
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

imwrite(Newimg/256,'Average.jpg');

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg/256);
title('Image after smoothing (3x3 mask)');

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Median filter
img = imread('Panchal.png'); % input image

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

imwrite(Newimg/256,'Median.jpg');

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg/256);
title('Image after Median Filter');

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Noise 1
img = imread('Panchal.png'); % input image

[rows,columns] = size(img);
Newimg = zeros(rows,columns);
for x=1:1:rows
    for y=1:1:columns
        Newimg(x,y) = img(x,y);
    end
end

for x=1:5:rows
    for y=1:randi([1 8],1,1):columns
         pix = randi([1 rows],1,1);
               if(Newimg(pix,y)<50)
                   Newimg(pix,y) = 255;
               else
                   Newimg(pix,y) = 0;
               end
    end
end

Noisy = zeros(rows,columns);

for x=1:1:rows
    for y=1:1:columns
        Noisy(x,y) = Newimg(x,y);
    end
end

imwrite(Newimg/256,'Noisy.jpg');

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg/256);
title('Image with noise');

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Laplacian N4
img1 = imread('Panchal.png'); % input image

img = im2double(img1);
[rows,columns] = size(img);
mask = [0 1 0; 1 -4 1; 0 1 0];
Newimg = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1
        p1 = (img(x-1,y-1)*mask(1,1))+(img(x,y-1)*mask(2,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x,y)*mask(2,2))+(img(x+1,y)*mask(3,2))+(img(x-1,y+1)*mask(1,3))+(img(x,y+1)*mask(2,3))+(img(x+1,y+1)*mask(3,3));
        Newimg(x,y) = abs(double(p1));
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

subplot(1,2,1);
imshow(img);
title('Original image');

subplot(1,2,2);
imshow(Newimg);
title('Laplacian with N4 ');

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Laplacian N4
img1 = imread('Panchal.png'); % input image

img = im2double(img1);
[rows,columns] = size(img);
mask = [1 0 1; 0 -4 0; 1 0 1];
Newimg = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1
        p1 = (img(x-1,y-1)*mask(1,1))+(img(x,y-1)*mask(2,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x,y)*mask(2,2))+(img(x+1,y)*mask(3,2))+(img(x-1,y+1)*mask(1,3))+(img(x,y+1)*mask(2,3))+(img(x+1,y+1)*mask(3,3));
        Newimg(x,y) = abs(double(p1));
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

subplot(1,2,1);
imshow(img);
title('Original image');

subplot(1,2,2);
imshow(Newimg);
title('Laplacian with 4 Diagonally ');




