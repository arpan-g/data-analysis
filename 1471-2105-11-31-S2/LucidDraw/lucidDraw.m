function varargout = lucidDraw(varargin)
warning off all;

% LUCIDDRAW M-file for lucidDraw.fig
%      LUCIDDRAW, by itself, creates a new LUCIDDRAW or raises the existing
%      singleton*.
%
%      H = LUCIDDRAW returns the handle to a new LUCIDDRAW or the handle to
%      the existing singleton*.
%
%      LUCIDDRAW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LUCIDDRAW.M with the given input arguments.
%
%      LUCIDDRAW('Property','Value',...) creates a new LUCIDDRAW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lucidDraw_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lucidDraw_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lucidDraw

% Last Modified by GUIDE v2.5 16-Nov-2009 17:00:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @lucidDraw_OpeningFcn, ...
    'gui_OutputFcn',  @lucidDraw_OutputFcn, ...
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
% --- Executes just before lucidDraw is made visible.
function lucidDraw_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lucidDraw (see VARARGIN)

% Choose default command line output for lucidDraw
handles.tempClass='none';%save temp class
handles.OneClass='none';
handles.style='Common';
handles.pertebation=0.7;
handles.Iter=20;
handles.addatti='N';

handles.matrixinput=0;
handles.classinput=0;
handles.isOkuserclassid=0;
handles.isOkusernetwork=0;
set(handles.pertubText, 'string','Perturbation probability(0-1)=0.7');
set(handles.iterText, 'string','Iterations(1-100)=20');
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes lucidDraw wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = lucidDraw_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in rundemo.
function rundemo_Callback(hObject, eventdata, handles)
javaaddpath('LucidDraw.jar'); % Add JAR files to current dynamic Java class path.
%**************************************************************************************************************************
%**************************************************************************************************************************
[A_adja_Matrix Label]=Text_To_AdjacencyMatrix('PAO1_290nodes.txt');
classid=Read_Classid('PAO1_290nodes_class.txt',Label);
opts.OneClass='none';
opts.LayoutStyle='Common';
opts.Perturbation =0.7;
opts.MaxIter=60;
opts.Add_Biological_Attribute='N';
[x y] = FastGridLayout(A_adja_Matrix,opts,classid);
LayoutView(A_adja_Matrix,x,y,Label,classid);
%**************************************************************************************************************************
%**************************************************************************************************************************
javarmpath('LucidDraw.jar');  % Remove dynamic class path.

% --- Executes on selection change in layoutstyle.
function layoutstyle_Callback(hObject, eventdata, handles)
index_Style = get(handles.layoutstyle,'Value');  %listbox1是你自己的那个控件的tag名字
my_Style =get(handles.layoutstyle,'String');   %得到了你的listBoxes的列表
my_Style_type =my_Style{index_Style};
handles.action=1;
handles.style=my_Style_type;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function layoutstyle_CreateFcn(hObject, eventdata, handles)
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in inputusernetwork.
function inputusernetwork_Callback(hObject, eventdata, handles)
[fname,pn]=uigetfile('*.txt','Please select a Network file');%打开一个选择M文件的对话框，并选择一个文件
if ~isempty(fname)
filenamekkk=strcat(pn,fname);
[A_adja_Matrix Label]=Text_To_AdjacencyMatrix(filenamekkk);
handles.my_Matrix=A_adja_Matrix;
handles.my_Label=Label;
handles.matrixinput=1;
if(get(handles.inputusernetwork,'Value')==1)
    handles.isOkusernetwork=1;
else
    handles.isOkusernetwork=0;
end


if((handles.isOkusernetwork==1))
    set(handles.Run,'Enable','on');
else
    set(handles.Run,'Enable','off');
end
end
guidata(hObject,handles);


% --- Executes on button press in inputuserclassid.
function inputuserclassid_Callback(hObject, eventdata, handles)
[fname_classid,pn_classid]=uigetfile('*.txt','Please select a Node Class file');%打开一个选择M文件的对话框，并选择一个文件
%handles.myname_nodeclass=fname1;
Label=handles.my_Label;
classid=Read_Classid(fname_classid,Label);
handles.my_classid=classid;
handles.classinput=1;
if(get(handles.inputuserclassid,'Value')==1)
    handles.isOkuserclassid=1;
else
    handles.isOkuserclassid=0;
end
guidata(hObject,handles);
function iter_Callback(hObject, eventdata, handles)
itert= get(handles.iter,'Value');
handles.myitert=itert;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function iter_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function pertubation_Callback(hObject, eventdata, handles)
pertu= get(handles.pertubation,'Value');
handles.mypertu=pertu;
pertuStr=strcat('Perturbation probability(0-1)=',num2str(pertu));
set(handles.pertubText, 'string',pertuStr); % num2str(pertu)
handles.pertebation=pertu;

guidata(hObject,handles);

function pertubation_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in yes.
function yes_Callback(hObject, eventdata, handles)

if ~strcmp(handles.OneClass,'none')
    set(handles.addOneClass,'Enable','off');
    handles.tempClass=handles.OneClass;
     %set(handles.addOneClass,'String','none');
     handles.OneClass='none';
end
if(get(hObject,'Value')==get(hObject,'Max'))
    handles.addatti='Y';
    set(handles.no,'Value',0);
   
else
    set(handles.no,'Value',1);
    handles.addatti='N';
    
end
guidata(hObject,handles);

% --- Executes on button press in no.
function no_Callback(hObject, eventdata, handles)

   set(handles.addOneClass,'Enable','on');
   handles.OneClass= handles.tempClass;
   
if(get(hObject,'Value')==get(hObject,'Max'))
    handles.addatti='N';
    set(handles.yes,'Value',0);
else
    set(handles.yes,'Value',1);
    handles.addatti='Y';
end
guidata(hObject,handles);

% --- Executes on button press in Run.
function Run_Callback(hObject, eventdata, handles)
javaaddpath('LucidDraw.jar'); % Add JAR files to current dynamic Java class path.
button_state_Run = get(hObject,'Value');
if (button_state_Run==get(hObject,'Max'))
    opts.OneClass=handles.OneClass;
    opts.LayoutStyle=handles.style;
    opts.Perturbation =handles.pertebation;
    opts.MaxIter=handles.Iter;
    opts.Add_Biological_Attribute= handles.addatti;
    A_adja_Matrix=handles.my_Matrix;
    if(handles.classinput==0)
        mm1=length(A_adja_Matrix);
        classid=ones(mm1,1);    
    else
        classid=handles.my_classid;
    end
    [x y] = FastGridLayout(A_adja_Matrix,opts,classid);
     
    Label=handles.my_Label;
    LayoutView(A_adja_Matrix,x,y,Label,classid);
  
elseif (button_state_Ok==get(hObject,'Min'))

end
javarmpath('LucidDraw.jar');  % Remove dynamic class path.
guidata(hObject,handles);


% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
button_state_cancel = get(hObject,'Value');
if (button_state_cancel==get(hObject,'Max'))
      set(handles.Run,'Enable','off');
       clear all;
       close();
end

function LucidIter_Callback(hObject, eventdata, handles)
itert= get(handles.LucidIter,'Value');
My_iter=fix(itert)+1;
handles.myitert=My_iter;

IterStr=strcat('Iterations(1-100)=',num2str(My_iter));
set(handles.iterText, 'string',IterStr); % num2str(pertu)

handles.Iter=My_iter;
guidata(hObject,handles);

function LucidIter_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in addOneClass.
function addOneClass_Callback(hObject, eventdata, handles)
index_oneclass = get(handles.addOneClass,'Value');  %listbox1是你自己的那个控件的tag名字
my_oneclass =get(handles.addOneClass,'String');   %得到了你的listBoxes的列表
my_oneclass_type =my_oneclass{index_oneclass};
handles.action=1;
handles.OneClass=my_oneclass_type;

if ~strcmp(handles.OneClass,'none')&&handles.addatti=='Y'
     handles.addatti='N';
     set(handles.yes,'Value',0);
     set(handles.no,'Value',1);
end
guidata(hObject,handles);
% hObject    handle to addOneClass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns addOneClass contents as cell array
%        contents{get(hObject,'Value')} returns selected item from addOneClass


% --- Executes during object creation, after setting all properties.
function addOneClass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to addOneClass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


