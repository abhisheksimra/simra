
a=imread('C:\Users\Simra\Desktop\unnamed.jpg');
b=imread('C:\Users\Simra\Desktop\t2.jpg');

d=a./2;
e=b./2;

c=d-e;
%imsub(d,e);
imshow(c)