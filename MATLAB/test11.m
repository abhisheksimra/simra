a=menu('val1','1','2','3','4','5','6','7','8','9','10');
b=menu('val1','1','2','3','4','5','6','7','8','9','10');
c=inputdlg('operation');
z=str2double
switch z
    case 1
        c=testa1(a,b);
        d=num2str(c);
        msgbox(sprintf(d));
    case 2
        c=testa2(a,b);
        d=num2str(c);
        msgbox(sprintf(d));
    case 3
        c=testa3(a,b);
        d=num2str(c);
        msgbox(sprintf(d));
    case 4
        c=testa4(a,b);
        d=num2str(c);
        msgbox(sprintf(d));
        
end