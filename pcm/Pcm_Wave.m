function varargout = Pcm_Wave(varargin)
% PCM_WAVE MATLAB code for Pcm_Wave.fig
%      PCM_WAVE, by itself, creates a new PCM_WAVE or raises the existing
%      singleton*.
%
%      H = PCM_WAVE returns the handle to a new PCM_WAVE or the handle to
%      the existing singleton*.
%
%      PCM_WAVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PCM_WAVE.M with the given input arguments.
%
%      PCM_WAVE('Property','Value',...) creates a new PCM_WAVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Pcm_Wave_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Pcm_Wave_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Pcm_Wave

% Last Modified by GUIDE v2.5 07-Jul-2020 13:08:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Pcm_Wave_OpeningFcn, ...
                   'gui_OutputFcn',  @Pcm_Wave_OutputFcn, ...
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


% --- Executes just before Pcm_Wave is made visible.
function Pcm_Wave_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Pcm_Wave (see VARARGIN)

% Choose default command line output for Pcm_Wave
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Pcm_Wave wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Pcm_Wave_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%PCM
% %Analog signal

c=get(handles.edit1,'string');
d=get(handles.edit2,'string');
a=str2double(c); %amplitude
f=str2double(d); %frequncy

fs=1000*f; % Nyquist sampling rate
t=0:1/fs:1; %time
x=a*sin(2*pi*f*t);

% original signal
axes(handles.axes1)
plot(t,x);
title('Original Signal');
xlabel('Time');
ylabel('Amplitude')
guidata(hObject,handles)


%level shifting
xq=x+a;

% Quantization
q_op=round(xq);

% Transmited signal
axes(handles.axes2)
plot(t,q_op);
title('Transmited signal');
xlabel('Time');
ylabel('Amplitude')
guidata(hObject,handles)

%decimal to binnary  convertion
enco=de2bi(q_op,'left-msb');

% pcm reciver
deco=bi2de(enco,'left-msb');

%shifting the amplitude level to the original value
xr=deco-a;

% reconstructed signal
axes(handles.axes3)
plot(t,xr);
title('Reconstructed Signal');
xlabel('Time');
ylabel('Amplitude')
guidata(hObject,handles)

% low pass filtering
[num den]=butter(5,4*f/fs); %butterworth LPF
rec_op=filter(num,den,xr); %smoothing

%recived signal
axes(handles.axes4)
plot(t, rec_op);
xlabel('Time');
ylabel('Amplitude');
title('Recieved signal');
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
