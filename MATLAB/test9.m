
x=inputdlg('enter first no. :');
y=inputdlg('enter seconnd no. :');
a=str2double(x);
b=str2double(y);
c = inputdlg('enter what to do :');
z=str2double(c);
switch z
    case 1
        f=num2str(a+b)
        msgbox(sprintf(f))
    case 2
         f=num2str(a-b)
        msgbox(sprintf(f))
    case 3
         f=num2str(a*b)
        msgbox(sprintf(f))
    case 4
         f=num2str(a/b)
        msgbox(sprintf(f))
    otherwise
        msgbox('invalid')
end

