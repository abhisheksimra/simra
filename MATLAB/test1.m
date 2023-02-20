 x=linspace(0,2*pi,100);
y=sin(x);
z=cos(x);
a=tan(x);
plot(x,y,'y+',x,z,'b*');
figure(2),plot(x,y)
figure(3),plot(x,z)
xlabel('x di');
ylabel('y sin');
title('plot xy','fontsize',18);
legend('sin(x)','cos(x)','tan(x)')
