function varargout = Project_4(varargin)
% PROJECT_4 MATLAB code for Project_4.fig
%      PROJECT_4, by itself, creates a new PROJECT_4 or raises the existing
%      singleton*.
%
%      H = PROJECT_4 returns the handle to a new PROJECT_4 or the handle to
%      the existing singleton*.
%
%      PROJECT_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_4.M with the given input arguments.
%
%      PROJECT_4('Property','Value',...) creates a new PROJECT_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project_4

% Last Modified by GUIDE v2.5 19-Apr-2016 20:03:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project_4_OpeningFcn, ...
                   'gui_OutputFcn',  @Project_4_OutputFcn, ...
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


% --- Executes just before Project_4 is made visible.
function Project_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project_4 (see VARARGIN)

% Choose default command line output for Project_4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project_4_OutputFcn(hObject, eventdata, handles) 
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

% ------- Steg -------

[path,operation]=imgetfile();

if (operation)
    disp('Image not selected by the user');
end

original = imread(path);
msg=get(handles.inputtext,'String');
if isempty(msg)
fprintf('Error: Enter the text first\n');

else
    
end
% msg = input('Enter the text you want to hide in the Image : ');
original(1:1:1)= length(msg) ;
original=imresize(original,[size(original,1) size(original,2)],'nearest');
message = msg ;
message = strtrim(message);
msgbitlength = length(message) * 8;
AsciiCode = uint8(message);
binaryString = (dec2bin(AsciiCode,8));
binaryString = transpose(binaryString);
binaryString = binaryString(:);
N = length(binaryString);
b = zeros(N,1);

for k = 1:N
  if(binaryString(k) == '1')
      b(k) = 1;
  else
      b(k) = 0;
  end
end


s = original;
  rows = size(original,1);
  cols = size(original,2);
k = 1;
for i = 1 : rows
  for j = 1 : cols
      LSB = mod(double(original(i,j)), 2);
      if (k > msgbitlength || LSB == b(k))
          s(i,j) = original(i,j);
      elseif(LSB == 1)
          s(i,j) = (original(i,j) - 1);
      elseif(LSB == 0)
          s(i,j) = (original(i,j) + 1);
      end
  k = k + 1;
  end
end
imgWTxt = 'Steg_Img.png';
imwrite(s,imgWTxt);
imshow(s);




function inputtext_Callback(hObject, eventdata, handles)
% hObject    handle to inputtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputtext as text
%        str2double(get(hObject,'String')) returns contents of inputtext as a double


% --- Executes during object creation, after setting all properties.
function inputtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% ***************** Decode text *************

s = imread('Steg_Img.png');
height = size(s,1);
width = size(s,2);
m =  double( s(1:1:1) ) * 8  ;
k = 1;
for i = 1 : height
  for j = 1 : width
      if (k <= m)
          b(k) = mod(double(s(i,j)),2);
          k = k + 1;
      end
  end
end
binaryVector = b;
binValues = [ 128 64 32 16 8 4 2 1 ];
binaryVector = binaryVector(:);
if mod(length(binaryVector),8) ~= 0
error('Length of binary vector must be a multiple of 8.');
end
binMatrix = reshape(binaryVector,8,[]);
textString = char(binValues*binMatrix);
disp(textString);
set(handles.text1,'string',textString);





function text1_Callback(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text1 as text
%        str2double(get(hObject,'String')) returns contents of text1 as a double


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
