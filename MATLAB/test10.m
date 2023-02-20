q=menu('calculator','add','sab','multi','div');

x=inputdlg('enter first no. :');
y=inputdlg('enter seconnd no. :');
a=str2double(x);
b=str2double(y);

switch q
    case 'add'
        f=num2str(a+b)
        msgbox(sprintf(f))
    case 'sub'
         f=num2str(a-b)
        msgbox(sprintf(f))
    case 'multi'
         f=num2str(a*b)
        msgbox(sprintf(f))
    case 'div'
         f=num2str(a/b)
        msgbox(sprintf(f))
    otherwise
        msgbox('invalid')
end
