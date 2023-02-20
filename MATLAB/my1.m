a=menu('val1','1','2','3','4');
b=menu('val1','1','2','3','4');
c=menu('val1','add','sub','mul','div');
switch c
    case 'add'
        disp(a+b)
    case 'sub'
        disp(a-b)
    case 'mul'
        disp(a*b)
    case 'div'
        disp(a/b)
end