function varargout = Form(varargin)
% FORM MATLAB code for Form.fig
%      FORM, by itself, creates a new FORM or raises the existing
%      singleton*.
%
%      H = FORM returns the handle to a new FORM or the handle to
%      the existing singleton*.
%
%      FORM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORM.M with the given input arguments.
%
%      FORM('Property','Value',...) creates a new FORM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Form_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Form_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Form

% Last Modified by GUIDE v2.5 16-Feb-2016 04:00:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Form_OpeningFcn, ...
                   'gui_OutputFcn',  @Form_OutputFcn, ...
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


% --- Executes just before Form is made visible.
function Form_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Form (see VARARGIN)

% Choose default command line output for Form
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Form wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Form_OutputFcn(hObject, eventdata, handles) 
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

% RGB to Grayscale

Orgimg = imread('Panchal.png'); % input image

[rows,columns] = size(Orgimg);
img = zeros(rows,columns);
for i=1:1:rows
    for j=1:1:columns
        img(i,j) =(0.21*Orgimg(i,j,1))+(0.71*Orgimg(i,j,2))+(0.08*Orgimg(i,j,3));
    end
end
subplot(1,2,1);
imshow(Orgimg);
title('RGB Image');

subplot(1,2,2);
imshow(img/256);
title('Grayscale Image');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Noise 2


img = imread('Panchal.png'); % input image
[rows,columns] = size(img);
Newimg = zeros(rows,columns);
for x=1:1:rows
    for y=1:1:columns
        Newimg(x,y) = img(x,y);
    end
end

for x=1:1:rows
    for y=1:1:columns
        Newimg(x,y) = img(x,y) + randi([20 40],1,1);
    end
end

imwrite(Newimg/256,'Noisy.jpg');

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg/256);
title('Image with noise');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%smoothening mask 3x3

img = imread('Panchal.png'); % input image
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

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg/256);
title('Image after smoothing (3x3 mask)');



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% smoothening using mask 5x5

img = imread('Panchal.png'); % input image
[rows,columns] = size(img);
i=2;j=2;
mask = (1/25)*[1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1];
Newimg = zeros(rows,columns);
for x=3:1:rows-2
    for y=3:1:columns-2
        Newimg(i,j) = (img(x-2,y-2)*mask(1,1))+(img(x-1,y-2)*mask(1,2))+(img(x,y-2)*mask(1,3))+(img(x+1,y-2)*mask(1,4))+(img(x+2,y-2)*mask(1,5))+(img(x-2,y-1)*mask(2,1))+(img(x-1,y-1)*mask(2,2))+(img(x,y-1)*mask(2,3))+(img(x+1,y-1)*mask(2,4))+(img(x+2,y-1)*mask(2,5))+(img(x-2,y)*mask(3,1))+(img(x-1,y)*mask(3,2))+(img(x,y)*mask(3,3))+(img(x+1,y)*mask(3,4))+(img(x+2,y)*mask(3,5))+(img(x-2,y+1)*mask(4,1))+(img(x-1,y+1)*mask(4,2))+(img(x,y+1)*mask(4,3))+(img(x+1,y+1)*mask(4,4))+(img(x+2,y+1)*mask(4,5))+(img(x-2,y+2)*mask(5,1))+(img(x-1,y+2)*mask(5,2))+(img(x,y+2)*mask(5,3))+(img(x+1,y+2)*mask(5,4))+(img(x+2,y+2)*mask(5,5));
        j=j+1;
    end
    i=i+1;
    j=2;
end

for x=1:1:columns
    Newimg(1,x) = img(1,x);
    Newimg(2,x) = img(2,x);
end

for y=2:1:rows-1
    Newimg(y,1) = img(y,1);
    Newimg(y,2) = img(y,2);
end

for x=1:1:columns
    Newimg(rows-1,x) = img(rows-1,x);
    Newimg(rows,x) = img(rows,x);
end

for y=2:1:rows
    Newimg(y,columns-1) = img(y,columns-1);
    Newimg(y,columns) = img(y,columns);
end

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg/256);
title('Image after smoothing (5x5 mask)');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
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

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg/256);
title('Image after Median Filter');



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Simple Thresholding

img = imread('Panchal.png'); % input image
[rows,columns] = size(img);
T = input('enter the threshold value from 0 to 255 : ') ;
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

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg/256);
title('Image after Thresholding');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% P-Tile Thresholding

img = imread('Panchal.png'); % input image
[rows,columns] = size(img);
T=input('Enter the % value for P-Tile Threshold: ');
max = 256;
val = max*(T/100);
Newimg = zeros(rows,columns);
for x=1:1:rows
    for y=1:1:columns
        if(img(x,y) < val)
            Newimg(x,y) = 0;
        else
            Newimg(x,y) = 255;
        end
    end
end

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg/256);
title('Image after P-tile Thresholding');

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Iterative Thresholding

img = imread('Panchal.png'); % input image
[rows,columns] = size(img); 
pa=0; qa=0; pb=0; qb=0; p=0; q=0;
T=150; T1 = 255;
Newimg = zeros(rows,columns);
while(T1-T > 2)
    for x=1:1:rows
        for y=1:1:columns
            if(img(x,y) < T)
                Newimg(x,y) = 0;
            else
                Newimg(x,y) = 255;
            end
            pa = pa + (img(x,y) * Newimg(x,y));     % This part of the code was
            pb = pb + (Newimg(x,y));                % explained by Anubhav Bhardwaj,
            qa = qa + (img(x,y) *(1-Newimg(x,y)));  % for how to calculate the
            qb = qb + (1-Newimg(x,y));              % variables of threshold.
        end
    end
    p = pa/pb;
    q = qa/qb;
    T1 = (p+q)/2;
    T = T1;
end

subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(Newimg/256);
title('Image after Iterative Thresholding');


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Contrast Enhancement

img = imread('Panchal.png'); % input image
[rows,columns] = size(img);
Newimg = zeros(rows,columns);

H = zeros(255,1);
for x=1:1:rows
    for y=1:1:columns
        H(img(x,y)+1) = H(img(x,y)+1) + 1;
    end
end

% blo = 80; bhi = 180;

for a=1:1:254
    if((H(a+1,1)-H(a,1)) > 60)
        blo = a+1;
        
        break;
    end
end
display(blo);

for a=1:1:255
    if((H((255-a)-1,1)-H((255-a),1)) > 80)
        bhi = (255-a);
        break;
    end
end
display(bhi);

for x=1:1:rows
    for y=1:1:columns
        if(img(x,y) < blo)
            Newimg(x,y) = 0;
        elseif(img(x,y) > bhi)
            Newimg(x,y) = 255;
        else
            Newimg(x,y) = ((double(img(x,y)-blo)/(bhi-blo))*256);
        end
    end
end

subplot(3,2,2);
imhist(img)
title('Original Image');

subplot(3,2,4);
imhist(Newimg/256)
title('Histogram of Original Image');

subplot(3,2,1);
imshow(img);
title('Enhanced Image');

subplot(3,2,3);
imshow(Newimg/256);
title('Histogram of Enhanced Image');


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = imread('Panchal.png'); % input image
[rows,columns] = size(a);
i=1; 
j=1;
c = zeros(rows/2, columns/2);
for x = 1:2:rows
    for y = 1:2:columns
        c(i,j) = a(x,y);
        j = j+1;
    end
    i = i+1;
    j = 1;
end

subplot(2,3,1);
imagesc(a), colormap(gray);
title('Original Image');

subplot(2,3,2);
imagesc(c), colormap(gray);
title('Re-sized Image');

