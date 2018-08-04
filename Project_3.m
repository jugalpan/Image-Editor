function varargout = Project_3(varargin)
% PROJECT_3 MATLAB code for Project_3.fig
%      PROJECT_3, by itself, creates a new PROJECT_3 or raises the existing
%      singleton*.
%
%      H = PROJECT_3 returns the handle to a new PROJECT_3 or the handle to
%      the existing singleton*.
%
%      PROJECT_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_3.M with the given input arguments.
%
%      PROJECT_3('Property','Value',...) creates a new PROJECT_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project_3

% Last Modified by GUIDE v2.5 29-Mar-2016 08:43:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_3_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_3_OutputFcn, ...
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


% --- Executes just before Project_3 is made visible.
function Project_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project_3 (see VARARGIN)

% Choose default command line output for Project_3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project_3_OutputFcn(hObject, eventdata, handles) 
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

% % Pyramid structure

img = imread('C:\Users\JUGAL\Documents\MATLAB\Pyramid_img.jpg');

% img = imread('C:\Users\JUGAL\Desktop\pmdd.jpg');

[rows,columns] = size(img);
p1 = zeros(rows/2, columns/2);
p2 = zeros(rows/4, columns/4);
p3 = zeros(rows/8, columns/8);
p4 = zeros(rows/16, columns/16);
p5 = zeros(rows/32, columns/32);
p6 = zeros(rows/64, columns/64);

i=1; j=1;
for x = 1:2:rows
    for y = 1:2:columns
        p1(i,j) = img(x,y)/4 + img(x+1,y)/4 + img(x,y+1)/4 + img(x+1,y+1)/4;
        j = j+1;
    end
    i = i+1;
    j = 1;
end

[rows,columns] = size(p1);
i=1; j=1;
for x = 1:2:rows
    for y = 1:2:columns
        p2(i,j) = p1(x,y)/4 + p1(x+1,y)/4 + p1(x,y+1)/4 + p1(x+1,y+1)/4;
        j = j+1;
    end
    i = i+1;
    j = 1;
end

[rows,columns] = size(p2);
i=1; j=1;
for x = 1:2:rows
    for y = 1:2:columns
        p3(i,j) = p2(x,y)/4 + p2(x+1,y)/4 + p2(x,y+1)/4 + p2(x+1,y+1)/4;
        j = j+1;
    end
    i = i+1;
    j = 1;
end

[rows,columns] = size(p3);
i=1; j=1;
for x = 1:2:rows
    for y = 1:2:columns
        p4(i,j) = p3(x,y)/4 + p3(x+1,y)/4 + p3(x,y+1)/4 + p3(x+1,y+1)/4;
        j = j+1;
    end
    i = i+1;
    j = 1;
end

[rows,columns] = size(p4);
i=1; j=1;
for x = 1:2:rows
    for y = 1:2:columns
        p5(i,j) = p4(x,y)/4 + p4(x+1,y)/4 + p4(x,y+1)/4 + p4(x+1,y+1)/4;
        j = j+1;
    end
    i = i+1;
    j = 1;
end

[rows,columns] = size(p5);
i=1; j=1;
for x = 1:2:rows
    for y = 1:2:columns
        p6(i,j) = p5(x,y)/4 + p5(x+1,y)/4 + p5(x,y+1)/4 + p5(x+1,y+1)/4;
        j = j+1;
    end
    i = i+1;
    j = 1;
end

imwrite(p1/256,'p1.jpg');
imwrite(p2/256,'p2.jpg');
imwrite(p3/256,'p3.jpg');
imwrite(p4/256,'p4.jpg');
imwrite(p5/256,'p5.jpg');
imwrite(p6/256,'p6.jpg');

subplot(2,3,1);
imagesc(p1), colormap(gray);
title('level 6 of pyramid');

subplot(2,3,2);
imagesc(p2), colormap(gray);
title('level 5 of pyramid');

subplot(2,3,3);
imagesc(p3), colormap(gray);
title('level 4 of pyramid');

subplot(2,3,4);
imagesc(p4), colormap(gray);
title('level 3 of pyramid');

subplot(2,3,5);
imagesc(p5), colormap(gray);
title('level 2 of pyramid');

subplot(2,3,6);
imagesc(p6), colormap(gray);
title('level 1 of pyramid');

figure, imagesc(img), colormap(gray);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% % Zero Order

p6 = imread('C:\Users\JUGAL\Documents\MATLAB\p6.jpg');
[rows,columns] = size(p6);
pd6 = zeros(rows*64, columns*64);
temp = zeros((rows*64)+1, (columns*64)+1);

i=1; j=1;
for x=2:2:(rows*2)+1
    for y=2:2:(columns*2)+1
        temp(x,y) = p6(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*2)
    for y=1:1:(columns*2)
        pd6(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*4)+1
    for y=2:2:(columns*4)+1
        temp(x,y) = pd6(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*4)
    for y=1:1:(columns*4)
        pd6(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*8)+1
    for y=2:2:(columns*8)+1
        temp(x,y) = pd6(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*8)
    for y=1:1:(columns*8)
        pd6(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*16)+1
    for y=2:2:(columns*16)+1
        temp(x,y) = pd6(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*16)
    for y=1:1:(columns*16)
        pd6(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*32)+1
    for y=2:2:(columns*32)+1
        temp(x,y) = pd6(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*32)
    for y=1:1:(columns*32)
        pd6(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*64)+1
    for y=2:2:(columns*64)+1
        temp(x,y) = pd6(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*64)
    for y=1:1:(columns*64)
        pd6(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end


p5 = imread('C:\Users\JUGAL\Documents\MATLAB\p5.jpg');
[rows,columns] = size(p5);
pd5 = zeros(rows*32, columns*32);
temp = zeros((rows*32)+1, (columns*32)+1);

i=1; j=1;
for x=2:2:(rows*2)+1
    for y=2:2:(columns*2)+1
        temp(x,y) = p5(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*2)
    for y=1:1:(columns*2)
        pd5(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*4)+1
    for y=2:2:(columns*4)+1
        temp(x,y) = pd5(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*4)
    for y=1:1:(columns*4)
        pd5(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*8)+1
    for y=2:2:(columns*8)+1
        temp(x,y) = pd5(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*8)
    for y=1:1:(columns*8)
        pd5(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*16)+1
    for y=2:2:(columns*16)+1
        temp(x,y) = pd5(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*16)
    for y=1:1:(columns*16)
        pd5(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*32)+1
    for y=2:2:(columns*32)+1
        temp(x,y) = pd5(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*32)
    for y=1:1:(columns*32)
        pd5(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end


p4 = imread('C:\Users\JUGAL\Documents\MATLAB\p4.jpg');
[rows,columns] = size(p4);
pd4 = zeros(rows*16, columns*16);
temp = zeros((rows*16)+1, (columns*16)+1);

i=1; j=1;
for x=2:2:(rows*2)+1
    for y=2:2:(columns*2)+1
        temp(x,y) = p4(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*2)
    for y=1:1:(columns*2)
        pd4(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*4)+1
    for y=2:2:(columns*4)+1
        temp(x,y) = pd4(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*4)
    for y=1:1:(columns*4)
        pd4(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*8)+1
    for y=2:2:(columns*8)+1
        temp(x,y) = pd4(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*8)
    for y=1:1:(columns*8)
        pd4(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*16)+1
    for y=2:2:(columns*16)+1
        temp(x,y) = pd4(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*16)
    for y=1:1:(columns*16)
        pd4(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end


p3 = imread('C:\Users\JUGAL\Documents\MATLAB\p3.jpg');
[rows,columns] = size(p3);
pd3 = zeros(rows*8, columns*8);
temp = zeros((rows*8)+1, (columns*8)+1);

i=1; j=1;
for x=2:2:(rows*2)+1
    for y=2:2:(columns*2)+1
        temp(x,y) = p3(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*2)
    for y=1:1:(columns*2)
        pd3(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*4)+1
    for y=2:2:(columns*4)+1
        temp(x,y) = pd3(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*4)
    for y=1:1:(columns*4)
        pd3(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*8)+1
    for y=2:2:(columns*8)+1
        temp(x,y) = pd3(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*8)
    for y=1:1:(columns*8)
        pd3(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end


p2 = imread('C:\Users\JUGAL\Documents\MATLAB\p2.jpg');
[rows,columns] = size(p2);
pd2 = zeros(rows*4, columns*4);
temp = zeros((rows*4)+1, (columns*4)+1);

i=1; j=1;
for x=2:2:(rows*2)+1
    for y=2:2:(columns*2)+1
        temp(x,y) = p2(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*2)
    for y=1:1:(columns*2)
        pd2(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end

i=1; j=1;
for x=2:2:(rows*4)+1
    for y=2:2:(columns*4)+1
        temp(x,y) = pd2(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*4)
    for y=1:1:(columns*4)
        pd2(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end


p1 = imread('C:\Users\JUGAL\Documents\MATLAB\p1.jpg');
[rows,columns] = size(p1);
pd1 = zeros(rows*2, columns*2);
temp = zeros((rows*2)+1, (columns*2)+1);

i=1; j=1;
for x=2:2:(rows*2)+1
    for y=2:2:(columns*2)+1
        temp(x,y) = p1(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=1:1:(rows*2)
    for y=1:1:(columns*2)
        pd1(x,y) = temp(x,y)+ temp(x+1,y) +temp(x,y+1) + temp(x+1,y+1);
    end
end


subplot(2,3,1);
imagesc(pd1), colormap(gray);
title('level 6 of pyramid');

subplot(2,3,2);
imagesc(pd2), colormap(gray);
title('level 5 of pyramid');

subplot(2,3,3);
imagesc(pd3), colormap(gray);
title('level 4 of pyramid');

subplot(2,3,4);
imagesc(pd4), colormap(gray);
title('level 3 of pyramid');

subplot(2,3,5);
imagesc(pd5), colormap(gray);
title('level 2 of pyramid');

subplot(2,3,6);
imagesc(pd6), colormap(gray);
title('level 1 of pyramid');



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% % First Order 

m = [1/4 1/2 1/4; 1/2 1 1/2; 1/4 1/2 1/4];
p6 = imread('C:\Users\JUGAL\Documents\MATLAB\p6.jpg');
[rows,columns] = size(p6);
pd6 = zeros(rows*64, columns*64);
pd6_temp6 = zeros(rows*2, columns*2);
pd6_temp5 = zeros(rows*4, columns*4);
pd6_temp4 = zeros(rows*8, columns*8);
pd6_temp3 = zeros(rows*16, columns*16);
pd6_temp2 = zeros(rows*32, columns*32);
temp = zeros((rows*64)+2, (columns*64)+2);

i=1; j=1;
for x=2:2:(rows*2)+1
    for y=2:2:(columns*2)+1
        temp(x,y) = p6(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*2)+1
    for y=2:1:(columns*2)+1
        pd6_temp6(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i=i+1;
    j=1;
end

i=1; j=1;
for x=2:2:(rows*4)+1
    for y=2:2:(columns*4)+1
        temp(x,y) = pd6_temp6(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*4)+1
    for y=2:1:(columns*4)+1
        pd6_temp5(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j = 1;
end


i=1; j=1;
for x=2:2:(rows*8)+1
    for y=2:2:(columns*8)+1
        temp(x,y) = pd6_temp5(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*8)+1
    for y=2:1:(columns*8)+1
        pd6_temp4(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j=1;
end

i=1; j=1;
for x=2:2:(rows*16)+1
    for y=2:2:(columns*16)+1
        temp(x,y) = pd6_temp4(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*16)+1
    for y=2:1:(columns*16)+1
        pd6_temp3(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j=1;
end

i=1; j=1;
for x=2:2:(rows*32)+1
    for y=2:2:(columns*32)+1
        temp(x,y) = pd6_temp3(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*32)+1
    for y=2:1:(columns*32)+1
        pd6_temp2(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j=1;
end

i=1; j=1;
for x=2:2:(rows*64)+1
    for y=2:2:(columns*64)+1
        temp(x,y) = pd6_temp2(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*64)+1
    for y=2:1:(columns*64)+1
        pd6(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j=1;
end




p5 = imread('C:\Users\JUGAL\Documents\MATLAB\p5.jpg');
[rows,columns] = size(p5);
pd5 = zeros(rows*32, columns*32);
pd5_temp6 = zeros(rows*2, columns*2);
pd5_temp5 = zeros(rows*4, columns*4);
pd5_temp4 = zeros(rows*8, columns*8);
pd5_temp3 = zeros(rows*16, columns*16);
temp = zeros((rows*32)+1, (columns*32)+1);

i=1; j=1;
for x=2:2:(rows*2)+1
    for y=2:2:(columns*2)+1
        temp(x,y) = p5(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*2)
    for y=2:1:(columns*2)
        pd5_temp6(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j=1;
end

i=1; j=1;
for x=2:2:(rows*4)+1
    for y=2:2:(columns*4)+1
        temp(x,y) = pd5_temp6(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*4)
    for y=2:1:(columns*4)
        pd5_temp5(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j=1;
end

i=1; j=1;
for x=2:2:(rows*8)+1
    for y=2:2:(columns*8)+1
        temp(x,y) = pd5_temp5(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*8)
    for y=2:1:(columns*8)
        pd5_temp4(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j=1;
end

i=1; j=1;
for x=2:2:(rows*16)+1
    for y=2:2:(columns*16)+1
        temp(x,y) = pd5_temp4(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*16)
    for y=2:1:(columns*16)
        pd5_temp3(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j=1;
end

i=1; j=1;
for x=2:2:(rows*32)+1
    for y=2:2:(columns*32)+1
        temp(x,y) = pd5_temp3(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*32)
    for y=2:1:(columns*32)
        pd5(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
    j = j+1;
    end
    i = i+1;
    j=1;
end


p4 = imread('C:\Users\JUGAL\Documents\MATLAB\p4.jpg');
[rows,columns] = size(p4);
pd4 = zeros(rows*16, columns*16);
pd4_temp6 = zeros(rows*2, columns*2);
pd4_temp5 = zeros(rows*4, columns*4);
pd4_temp4 = zeros(rows*8, columns*8);
temp = zeros((rows*16)+2, (columns*16)+2);

i=1; j=1;
for x=2:2:(rows*2)+1
    for y=2:2:(columns*2)+1
        temp(x,y) = p4(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*2)+1
    for y=2:1:(columns*2)+1
        pd4_temp6(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j=1;
end

i=1; j=1;
for x=2:2:(rows*4)+1
    for y=2:2:(columns*4)+1
        temp(x,y) = pd4_temp6(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*4)+1
    for y=2:1:(columns*4)+1
        pd4_temp5(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j=1;
end


i=1; j=1;
for x=2:2:(rows*8)+1
    for y=2:2:(columns*8)+1
        temp(x,y) = pd4_temp5(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*8)+1
    for y=2:1:(columns*8)+1
        pd4_temp4(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j=1;
end

i=1; j=1;
for x=2:2:(rows*16)+1
    for y=2:2:(columns*16)+1
        temp(x,y) = pd4_temp4(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
i=1; j=1;
for x=2:1:(rows*16)+1
    for y=2:1:(columns*16)+1
        pd4(i,j) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
        j = j+1;
    end
    i = i+1;
    j=1;
end


p3 = imread('C:\Users\JUGAL\Documents\MATLAB\p3.jpg');
[rows,columns] = size(p3);
pd3 = zeros(rows*8, columns*8);
temp = zeros((rows*8)+1, (columns*8)+1);

i=1; j=1;
for x=2:2:(rows*2)+1
    for y=2:2:(columns*2)+1
        temp(x,y) = p3(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=2:1:(rows*2)
    for y=2:1:(columns*2)
        pd3(x,y) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
    end
end

i=1; j=1;
for x=2:2:(rows*4)+1
    for y=2:2:(columns*4)+1
        temp(x,y) = pd3(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=2:1:(rows*4)
    for y=2:1:(columns*4)
        pd3(x,y) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
    end
end

i=1; j=1;
for x=2:2:(rows*8)+1
    for y=2:2:(columns*8)+1
        temp(x,y) = pd3(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=2:1:(rows*8)
    for y=2:1:(columns*8)
        pd3(x,y) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
    end
end

% 
% p2 = imread('C:\Users\JUGAL\Documents\MATLAB\p2.jpg');
% [rows,columns] = size(p2);
% pd2 = zeros(rows*4, columns*4);
% temp = zeros((rows*4)+1, (columns*4)+1);
% 
% i=1; j=1;
% for x=2:2:(rows*2)+1
%     for y=2:2:(columns*2)+1
%         temp(x,y) = p2(i,j);
%         j = j+1;
%     end
%     i = i+1;
%     j=1;
% end
% for x=2:1:(rows*2)
%     for y=2:1:(columns*2)
%         pd2(x,y) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
%     end
% end
% 
% i=1; j=1;
% for x=2:2:(rows*4)+1
%     for y=2:2:(columns*4)+1
%         temp(x,y) = pd2(i,j);
%         j = j+1;
%     end
%     i = i+1;
%     j=1;
% end
% for x=2:1:(rows*4)
%     for y=2:1:(columns*4)
%         pd2(x,y) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
%     end
% end


p2 = imread('C:\Users\JUGAL\Documents\MATLAB\p2.jpg');
[rows,columns] = size(p2);
pd2 = zeros(rows*4, columns*4);
temp = zeros((rows*4)+1, (columns*4)+1);

i=1; j=1;
for x=2:2:(rows*2)+1
    for y=2:2:(columns*2)+1
        temp(x,y) = p2(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=2:1:(rows*2)
    for y=2:1:(columns*2)
        pd2(x,y) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
    end
end

i=1; j=1;
for x=2:2:(rows*4)+1
    for y=2:2:(columns*4)+1
        temp(x,y) = pd2(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=2:1:(rows*4)
    for y=2:1:(columns*4)
        pd2(x,y) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
    end
end


p1 = imread('C:\Users\JUGAL\Documents\MATLAB\p1.jpg');
[rows,columns] = size(p1);
pd1 = zeros(rows*2, columns*2);
temp = zeros((rows*2)+1, (columns*2)+1);

i=1; j=1;
for x=2:2:(rows*2)+1
    for y=2:2:(columns*2)+1
        temp(x,y) = p1(i,j);
        j = j+1;
    end
    i = i+1;
    j=1;
end
for x=2:1:(rows*2)
    for y=2:1:(columns*2)
        pd1(x,y) = round( temp(x-1,y-1)*m(1,1) + temp(x-1,y)*m(1,2) + temp(x-1,y+1)*m(1,3) + temp(x,y-1)*m(2,1) + temp(x,y)*m(2,2) +  temp(x,y+1)*m(2,3) + temp(x+1,y-1)*m(3,1) + temp(x+1,y)*m(3,2) + temp(x+1,y+1)*m(3,3));
    end
end


subplot(2,3,1);
imagesc(pd1), colormap(gray);
title('level 6 of pyramid');

subplot(2,3,2);
imagesc(pd2), colormap(gray);
title('level 5 of pyramid');

subplot(2,3,3);
imagesc(pd3), colormap(gray);
title('level 4 of pyramid');

subplot(2,3,4);
imagesc(pd4), colormap(gray);
title('level 3 of pyramid');

subplot(2,3,5);
imagesc(pd5), colormap(gray);
title('level 2 of pyramid');

subplot(2,3,6);
imagesc(pd6), colormap(gray);
title('level 1 of pyramid');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% % Resize old method

a = imread('C:\Users\JUGAL\Documents\MATLAB\Pyramid_img.jpg');
% img = imread('C:\Users\JUGAL\Desktop\pmdd.jpg');
[rows,columns] = size(a);
p1 = zeros(rows/2, columns/2);
p2 = zeros(rows/4, columns/4);
p3 = zeros(rows/8, columns/8);
p4 = zeros(rows/16, columns/16);
p5 = zeros(rows/32, columns/32);
p6 = zeros(rows/64, columns/64);

i=1;  j=1;
for x = 1:2:rows
    for y = 1:2:columns
        p1(i,j) = a(x,y);
        j = j+1;
    end
    i = i+1;
    j = 1;
end

[rows,columns] = size(p1);
i=1;  j=1;
for x = 1:2:rows
    for y = 1:2:columns
        p2(i,j) = p1(x,y);
        j = j+1;
    end
    i = i+1;
    j = 1;
end

[rows,columns] = size(p2);
i=1;  j=1;
for x = 1:2:rows
    for y = 1:2:columns
        p3(i,j) = p2(x,y);
        j = j+1;
    end
    i = i+1;
    j = 1;
end

[rows,columns] = size(p3);
i=1;  j=1;
for x = 1:2:rows
    for y = 1:2:columns
        p4(i,j) = p3(x,y);
        j = j+1;
    end
    i = i+1;
    j = 1;
end

[rows,columns] = size(p4);
i=1;  j=1;
for x = 1:2:rows
    for y = 1:2:columns
        p5(i,j) = p4(x,y);
        j = j+1;
    end
    i = i+1;
    j = 1;
end

[rows,columns] = size(p5);
i=1;  j=1;
for x = 1:2:rows
    for y = 1:2:columns
        p6(i,j) = p5(x,y);
        j = j+1;
    end
    i = i+1;
    j = 1;
end


subplot(2,3,1);
imagesc(p1), colormap(gray);
title('level 6 of pyramid');

subplot(2,3,2);
imagesc(p2), colormap(gray);
title('level 5 of pyramid');

subplot(2,3,3);
imagesc(p3), colormap(gray);
title('level 4 of pyramid');

subplot(2,3,4);
imagesc(p4), colormap(gray);
title('level 3 of pyramid');

subplot(2,3,5);
imagesc(p5), colormap(gray);
title('level 2 of pyramid');

subplot(2,3,6);
imagesc(p6), colormap(gray);
title('level 1 of pyramid');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% % filter

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

imwrite(Newimg/256,'Pyramid_img.jpg');

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg/256);
title('Smooth Image');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% % Low pass Filter on result


img = imread('C:\Users\JUGAL\Documents\MATLAB\p1.jpg');
[rows,columns] = size(img);
i=2; 
j=2;
mask = (1/9)*[1 1 1; 1 1 1; 1 1 1];
Newimg_p1 = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1        
        Newimg_p1(i,j) = (img(x-1,y-1)*mask(1,1))+(img(x,y-1)*mask(2,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x,y)*mask(2,2))+(img(x+1,y)*mask(2,3))+(img(x-1,y+1)*mask(1,3))+(img(x,y+1)*mask(2,3))+(img(x+1,y+1)*mask(3,3));
        j=j+1;
    end
    i=i+1;
    j=2;
end

for x=1:1:columns
    Newimg_p1(1,x) = img(1,x);
end

for y=2:1:rows-1
    Newimg_p1(y,1) = img(y,1);
end

for x=1:1:columns
    Newimg_p1(rows,x) = img(rows,x);
end

for y=2:1:rows
    Newimg_p1(y,columns) = img(y,columns);
end



% ***************************************************************




img = imread('C:\Users\JUGAL\Documents\MATLAB\p2.jpg');
[rows,columns] = size(img);
i=2; 
j=2;
mask = (1/9)*[1 1 1; 1 1 1; 1 1 1];
Newimg_p2 = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1        
        Newimg_p2(i,j) = (img(x-1,y-1)*mask(1,1))+(img(x,y-1)*mask(2,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x,y)*mask(2,2))+(img(x+1,y)*mask(2,3))+(img(x-1,y+1)*mask(1,3))+(img(x,y+1)*mask(2,3))+(img(x+1,y+1)*mask(3,3));
        j=j+1;
    end
    i=i+1;
    j=2;
end

for x=1:1:columns
    Newimg_p2(1,x) = img(1,x);
end

for y=2:1:rows-1
    Newimg_p2(y,1) = img(y,1);
end

for x=1:1:columns
    Newimg_p2(rows,x) = img(rows,x);
end

for y=2:1:rows
    Newimg_p2(y,columns) = img(y,columns);
end



% ************************************************************



img = imread('C:\Users\JUGAL\Documents\MATLAB\p3.jpg');
[rows,columns] = size(img);
i=2; 
j=2;
mask = (1/9)*[1 1 1; 1 1 1; 1 1 1];
Newimg_p3 = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1        
        Newimg_p3(i,j) = (img(x-1,y-1)*mask(1,1))+(img(x,y-1)*mask(2,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x,y)*mask(2,2))+(img(x+1,y)*mask(2,3))+(img(x-1,y+1)*mask(1,3))+(img(x,y+1)*mask(2,3))+(img(x+1,y+1)*mask(3,3));
        j=j+1;
    end
    i=i+1;
    j=2;
end

for x=1:1:columns
    Newimg_p3(1,x) = img(1,x);
end

for y=2:1:rows-1
    Newimg_p3(y,1) = img(y,1);
end

for x=1:1:columns
    Newimg_p3(rows,x) = img(rows,x);
end

for y=2:1:rows
    Newimg_p3(y,columns) = img(y,columns);
end


% *********************************************************************************************


img = imread('C:\Users\JUGAL\Documents\MATLAB\p4.jpg');
[rows,columns] = size(img);
i=2; 
j=2;
mask = (1/9)*[1 1 1; 1 1 1; 1 1 1];
Newimg_p4 = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1        
        Newimg_p4(i,j) = (img(x-1,y-1)*mask(1,1))+(img(x,y-1)*mask(2,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x,y)*mask(2,2))+(img(x+1,y)*mask(2,3))+(img(x-1,y+1)*mask(1,3))+(img(x,y+1)*mask(2,3))+(img(x+1,y+1)*mask(3,3));
        j=j+1;
    end
    i=i+1;
    j=2;
end

for x=1:1:columns
    Newimg_p4(1,x) = img(1,x);
end

for y=2:1:rows-1
    Newimg_p4(y,1) = img(y,1);
end

for x=1:1:columns
    Newimg_p4(rows,x) = img(rows,x);
end

for y=2:1:rows
    Newimg_p4(y,columns) = img(y,columns);
end



% ******************************************************************************



img = imread('C:\Users\JUGAL\Documents\MATLAB\p5.jpg');
[rows,columns] = size(img);
i=2; 
j=2;
mask = (1/9)*[1 1 1; 1 1 1; 1 1 1];
Newimg_p5 = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1        
        Newimg_p5(i,j) = (img(x-1,y-1)*mask(1,1))+(img(x,y-1)*mask(2,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x,y)*mask(2,2))+(img(x+1,y)*mask(2,3))+(img(x-1,y+1)*mask(1,3))+(img(x,y+1)*mask(2,3))+(img(x+1,y+1)*mask(3,3));
        j=j+1;
    end
    i=i+1;
    j=2;
end

for x=1:1:columns
    Newimg_p5(1,x) = img(1,x);
end

for y=2:1:rows-1
    Newimg_p5(y,1) = img(y,1);
end

for x=1:1:columns
    Newimg_p5(rows,x) = img(rows,x);
end

for y=2:1:rows
    Newimg_p5(y,columns) = img(y,columns);
end


% ******************************************************************************


img = imread('C:\Users\JUGAL\Documents\MATLAB\p6.jpg');
[rows,columns] = size(img);
i=2; 
j=2;
mask = (1/9)*[1 1 1; 1 1 1; 1 1 1];
Newimg_p6 = zeros(rows,columns);
for x=2:1:rows-1
    for y=2:1:columns-1        
        Newimg_p6(i,j) = (img(x-1,y-1)*mask(1,1))+(img(x,y-1)*mask(2,1))+(img(x+1,y-1)*mask(3,1))+(img(x-1,y)*mask(1,2))+(img(x,y)*mask(2,2))+(img(x+1,y)*mask(2,3))+(img(x-1,y+1)*mask(1,3))+(img(x,y+1)*mask(2,3))+(img(x+1,y+1)*mask(3,3));
        j=j+1;
    end
    i=i+1;
    j=2;
end

for x=1:1:columns
    Newimg_p6(1,x) = img(1,x);
end

for y=2:1:rows-1
    Newimg_p6(y,1) = img(y,1);
end

for x=1:1:columns
    Newimg_p6(rows,x) = img(rows,x);
end

for y=2:1:rows
    Newimg_p6(y,columns) = img(y,columns);
end


subplot(2,3,1);
imagesc(Newimg_p1), colormap(gray);
title('level 6 of pyramid');

subplot(2,3,2);
imagesc(Newimg_p2), colormap(gray);
title('level 5 of pyramid');

subplot(2,3,3);
imagesc(Newimg_p3), colormap(gray);
title('level 4 of pyramid');

subplot(2,3,4);
imagesc(Newimg_p4), colormap(gray);
title('level 3 of pyramid');

subplot(2,3,5);
imagesc(Newimg_p5), colormap(gray);
title('level 2 of pyramid');

subplot(2,3,6);
imagesc(Newimg_p6), colormap(gray);
title('level 1 of pyramid');



