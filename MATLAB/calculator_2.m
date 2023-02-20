% Simple calculator for understanding of GUI
function varargout = calculator_2(varargin)
% CALCULATOR_2 MATLAB code for calculator_2.fig
%      CALCULATOR_2, by itself, creates a new CALCULATOR_2 or raises the existing
%      singleton*.
%
%      H = CALCULATOR_2 returns the handle to a new CALCULATOR_2 or the handle to
%      the existing singleton*.
%
%      CALCULATOR_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULATOR_2.M with the given input arguments.
%
%      CALCULATOR_2('Property','Value',...) creates a new CALCULATOR_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before calculator_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to calculator_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help calculator_2
% Last Modified by GUIDE v2.5 26-Aug-2015 16:07:11
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @calculator_2_OpeningFcn, ...
                   'gui_OutputFcn',  @calculator_2_OutputFcn, ...
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
% --- Executes just before calculator_2 is made visible.
function calculator_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no textoutput args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to calculator_2 (see VARARGIN)
% Choose default command line textoutput for calculator_2
handles.textoutput = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes calculator_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = calculator_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning textoutput args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line textoutput from handles structure
varargout{1} = handles.textoutput;
% --- Executes on button press in minus.
function minus_Callback(hObject, eventdata, handles)
% hObject    handle to minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'-');
set(handles.input,'String',str);
% --- Executes on button press in plus.
function plus_Callback(hObject, eventdata, handles)
% hObject    handle to plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'+');
set(handles.input,'String',str);
% --- Executes on button press in division.
function division_Callback(hObject, eventdata, handles)
% hObject    handle to division (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'/');
set(handles.input,'String',str);
% --- Executes on button press in multiplication.
function multiplication_Callback(hObject, eventdata, handles)
% hObject    handle to multiplication (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'*');
set(handles.input,'String',str);
% --- Executes on button press in one.
function one_Callback(hObject, eventdata, handles)
% hObject    handle to one (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'1');
set(handles.input,'String',str);
% --- Executes on button press in four.
function four_Callback(hObject, eventdata, handles)
% hObject    handle to four (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'4');
set(handles.input,'String',str);
% --- Executes on button press in seven.
function seven_Callback(hObject, eventdata, handles)
% hObject    handle to seven (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'7');
set(handles.input,'String',str);
% --- Executes on button press in two.
function two_Callback(hObject, eventdata, handles)
% hObject    handle to two (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'2');
set(handles.input,'String',str);
% --- Executes on button press in three.
function three_Callback(hObject, eventdata, handles)
% hObject    handle to three (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'3');
set(handles.input,'String',str);
% --- Executes on button press in five.
function five_Callback(hObject, eventdata, handles)
% hObject    handle to five (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'5');
set(handles.input,'String',str);
% --- Executes on button press in six.
function six_Callback(hObject, eventdata, handles)
% hObject    handle to six (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'6');
set(handles.input,'String',str);
% --- Executes on button press in eight.
function eight_Callback(hObject, eventdata, handles)
% hObject    handle to eight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'8');
set(handles.input,'String',str);
% --- Executes on button press in zero.
function zero_Callback(hObject, eventdata, handles)
% hObject    handle to zero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'0');
set(handles.input,'String',str);
% --- Executes on button press in nine.
function nine_Callback(hObject, eventdata, handles)
% hObject    handle to nine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'9');
set(handles.input,'String',str);
% --- Executes on button press in rightbracket.
function rightbracket_Callback(hObject, eventdata, handles)
% hObject    handle to rightbracket (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,')');
set(handles.input,'String',str);
% --- Executes on button press in leftbracket.
function leftbracket_Callback(hObject, eventdata, handles)
% hObject    handle to leftbracket (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'(');
set(handles.input,'String',str);
% --- Executes on button press in decimal.
function decimal_Callback(hObject, eventdata, handles)
% hObject    handle to decimal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=strcat(str,'.');
set(handles.input,'String',str);
% --- Executes on button press in solve.
function solve_Callback(hObject, eventdata, handles)
% hObject    handle to solve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=eval(str);
set(handles.input,'String',str);
% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.input,'String','');
% --- Executes on button press in backspace.
function backspace_Callback(hObject, eventdata, handles)
% hObject    handle to backspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.input,'String');
str=str(1:end-1);
set(handles.input,'String',str);
% --- Executes when uipanel4 is resized.
function uipanel4_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
