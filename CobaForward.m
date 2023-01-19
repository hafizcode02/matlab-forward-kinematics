function varargout = CobaForward(varargin)
% COBAFORWARD MATLAB code for CobaForward.fig
%      COBAFORWARD, by itself, creates a new COBAFORWARD or raises the existing
%      singleton*.
%
%      H = COBAFORWARD returns the handle to a new COBAFORWARD or the handle to
%      the existing singleton*.
%
%      COBAFORWARD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COBAFORWARD.M with the given input arguments.
%
%      COBAFORWARD('Property','Value',...) creates a new COBAFORWARD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CobaForward_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CobaForward_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CobaForward

% Last Modified by GUIDE v2.5 11-Jan-2023 10:15:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CobaForward_OpeningFcn, ...
                   'gui_OutputFcn',  @CobaForward_OutputFcn, ...
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


% --- Executes just before CobaForward is made visible.
function CobaForward_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CobaForward (see VARARGIN)

% Choose default command line output for CobaForward
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CobaForward wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CobaForward_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Theta_1_Callback(~, ~, ~)
% hObject    handle to Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_1 as text
%        str2double(get(hObject,'String')) returns contents of Theta_1 as a double


% --- Executes during object creation, after setting all properties.
function Theta_1_CreateFcn(hObject, ~, ~)
% hObject    handle to Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_2_Callback(~, ~, ~)
% hObject    handle to Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_2 as text
%        str2double(get(hObject,'String')) returns contents of Theta_2 as a double


% --- Executes during object creation, after setting all properties.
function Theta_2_CreateFcn(hObject, ~, ~)
% hObject    handle to Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_3_Callback(~, ~, ~)
% hObject    handle to Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_3 as text
%        str2double(get(hObject,'String')) returns contents of Theta_3 as a double


% --- Executes during object creation, after setting all properties.
function Theta_3_CreateFcn(hObject, ~, ~)
% hObject    handle to Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Btn_FK.
function Btn_FK_Callback(~, ~, handles)
% hObject    handle to Btn_FK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Th_1 = str2double(handles.Theta_1.String)*pi/180
Th_2 = str2double(handles.Theta_2.String)*pi/180
Th_3 = str2double(handles.Theta_3.String)*pi/180

L_1 = str2double(handles.L1_SIZE.String)
L_2 = str2double(handles.L2_SIZE.String)
L_3 = str2double(handles.L3_SIZE.String)

L(1) = Link([0 L_1 0 pi/2])
L(2) = Link([0 0 L_2 0])
L(3) = Link([0 0 L_3 0])

Robot = SerialLink(L)
Robot.name = 'RRR_HABENDI';
T = Robot.fkine([Th_1 Th_2 Th_3])
Robot.plot([Th_1 Th_2 Th_3]);

set(handles.L1_SIZE, 'enable', 'off');
set(handles.L2_SIZE, 'enable', 'off');
set(handles.L3_SIZE, 'enable', 'off');

handles.Coor_X.String = num2str(floor(T(1,4)));
handles.Coor_Y.String = num2str(floor(T(2,4)));
handles.Coor_Z.String = num2str(floor(T(3,4)));


function Coor_X_Callback(~, ~, ~)
% hObject    handle to Coor_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Coor_X as text
%        str2double(get(hObject,'String')) returns contents of Coor_X as a double


% --- Executes during object creation, after setting all properties.
function Coor_X_CreateFcn(hObject, ~, ~)
% hObject    handle to Coor_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Coor_Y_Callback(~, ~, ~)
% hObject    handle to Coor_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Coor_Y as text
%        str2double(get(hObject,'String')) returns contents of Coor_Y as a double


% --- Executes during object creation, after setting all properties.
function Coor_Y_CreateFcn(hObject, ~, ~)
% hObject    handle to Coor_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Coor_Z_Callback(~, ~, ~)
% hObject    handle to Coor_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Coor_Z as text
%        str2double(get(hObject,'String')) returns contents of Coor_Z as a double


% --- Executes during object creation, after setting all properties.
function Coor_Z_CreateFcn(hObject, ~, ~)
% hObject    handle to Coor_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L1_SIZE_Callback(hObject, eventdata, handles)
% hObject    handle to L1_SIZE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L1_SIZE as text
%        str2double(get(hObject,'String')) returns contents of L1_SIZE as a double


% --- Executes during object creation, after setting all properties.
function L1_SIZE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L1_SIZE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L2_SIZE_Callback(hObject, eventdata, handles)
% hObject    handle to L2_SIZE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L2_SIZE as text
%        str2double(get(hObject,'String')) returns contents of L2_SIZE as a double


% --- Executes during object creation, after setting all properties.
function L2_SIZE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L2_SIZE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L3_SIZE_Callback(hObject, eventdata, handles)
% hObject    handle to L3_SIZE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L3_SIZE as text
%        str2double(get(hObject,'String')) returns contents of L3_SIZE as a double


% --- Executes during object creation, after setting all properties.
function L3_SIZE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L3_SIZE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
