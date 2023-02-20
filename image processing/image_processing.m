function varargout = image_processing(varargin)
% IMAGE_PROCESSING MATLAB code for image_processing.fig
%      IMAGE_PROCESSING, by itself, creates a new IMAGE_PROCESSING or raises the existing
%      singleton*.
%
%      H = IMAGE_PROCESSING returns the handle to a new IMAGE_PROCESSING or the handle to
%      the existing singleton*.
%
%      IMAGE_PROCESSING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_PROCESSING.M with the given input arguments.
%
%      IMAGE_PROCESSING('Property','Value',...) creates a new IMAGE_PROCESSING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before image_processing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to image_processing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help image_processing

% Last Modified by GUIDE v2.5 25-Aug-2020 17:47:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @image_processing_OpeningFcn, ...
                   'gui_OutputFcn',  @image_processing_OutputFcn, ...
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


% --- Executes just before image_processing is made visible.
function image_processing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to image_processing (see VARARGIN)

% Choose default command line output for image_processing
handles.output = hObject;


set(handles.axes1,'visible','off')
set(handles.axes2,'visible','off')

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes image_processing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = image_processing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in select_image.
function select_image_Callback(hObject, eventdata, handles)
% hObject    handle to select_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile()
a=imread(a);
axes(handles.axes1);
imshow(a);
title('Original Image');
setappdata(0,'a',a)


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset');
set(handles.axes1,'visible','off')
cla(handles.axes2,'reset');
set(handles.axes2,'visible','off')


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all
close all


% --- Executes on button press in rcb_gray.
function rcb_gray_Callback(hObject, eventdata, handles)
% hObject    handle to rcb_gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
agray=rgb2gray(a);
axes(handles.axes2);
imshow(agray);
title('Gray Image');


% --- Executes on button press in binary_image.
function binary_image_Callback(hObject, eventdata, handles)
% hObject    handle to binary_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
abw=im2bw(a);
axes(handles.axes2);
imshow(abw);
title('Binary Image');

% --- Executes on button press in gray_adj.
function gray_adj_Callback(hObject, eventdata, handles)
% hObject    handle to gray_adj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
img=a;
gray=rgb2gray(img);
adj_img=imadjust(gray,[0.3,0.7],[]);
axes(handles.axes2);
imshow(adj_img);
title('Gray Adjusted Image');

% --- Executes on button press in histogram.
function histogram_Callback(hObject, eventdata, handles)
% hObject    handle to histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
ahist=a;
ahist=rgb2gray(ahist);

% imhist=(ahist);
axes(handles.axes2);
imhist(ahist);
title('Histogram');



% --- Executes on button press in hist_adj.
function hist_adj_Callback(hObject, eventdata, handles)
% hObject    handle to hist_adj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
img_eq=histeq(a);
axes(handles.axes2);
imshow(img_eq);
title('Histogram Adjusted Image');


% --- Executes on button press in edge_det.
function edge_det_Callback(hObject, eventdata, handles)
% hObject    handle to edge_det (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
aedge=a;
aedge=rgb2gray(aedge);
aedge=edge(aedge,'canny');
axes(handles.axes2);
imshow(aedge);
title('Edge of Image');

% --- Executes on button press in rcb_ninsert.
function rcb_ninsert_Callback(hObject, eventdata, handles)
% hObject    handle to rcb_ninsert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
I=a;
J=imnoise(I,'salt & pepper',0.2);
axes(handles.axes2);
imshow(J); 
title('RCB Noice Inserted Image');

% --- Executes on button press in rcb_nfilter.
function rcb_nfilter_Callback(hObject, eventdata, handles)
% hObject    handle to rcb_nfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
I=a;
J=imnoise(I,'salt & pepper',0.2);

r=medfilt2(J(:, :, 1),[3 3]);
g=medfilt2(J(:, :, 2),[3 3]);
b=medfilt2(J(:, :, 3),[3 3]);

K=cat(3, r, g, b);
axes(handles.axes2);
imshow(K);
title('RCB Noice Filtered Image');
% --- Executes on button press in comp_img.
function comp_img_Callback(hObject, eventdata, handles)
% hObject    handle to comp_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
acomp=a;
acomp=imcomplement(acomp);
axes(handles.axes2);
imshow(acomp);
title('Complement Image');


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text2.
function text2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
