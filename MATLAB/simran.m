%G(s)=1000/s(1+0.1s)(1+0.001s)
num = [100];
den1=conv([1,0],[1,0.1]);
den=conv([den1],[1,0.001]);
G=tf(num,den);
bode(G)
grid on
margin(G)
