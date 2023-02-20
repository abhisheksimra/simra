x=linspace(0,4*pi,100);
y=sin(x);
z=cos(x);
plot(x,y,'y*',x,z,'rd');
xlabel('x-axis');
ylabel('y-axis');
legend('sin(x)','cos(x)')

figure(2),plot(x,y)
figure(3),plot(x,z)

figure(4),
subplot(4,2,3);plot(x,y)
subplot(4,2,7);plot(x,z)
