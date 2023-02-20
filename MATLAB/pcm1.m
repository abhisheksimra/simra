% pcm 
% pcm Transmiter
fm = 2; % msg freq
fs = 1000 * fm; % samp freq
t = 0:1/fs:1; %time
a=4; % amp
x = a * sin(2*pi*fm*t); %input msg signal
subplot(3,2,1);
plot(t, x, 'r');
xlabel('time');
ylabel('amplitude');
title('Original Message Signal');

% mid-tread quantization
enc=[];
for i=1:length(x)
    if (x(i)>0 && x(i)<=1)
        xq(i) = 0.5;
        e=[1 0 0];
    elseif (x(i)>1 && x(i)<=2)
        xq(i) = 1.5;
        e=[1 0 1];
    elseif (x(i)>2 && x(i)<=3)
        xq(i) = 2.5;
        e=[1 1 0];
    elseif (x(i)>3 && x(i)<=4)
        xq(i) = 3.5;
        e=[1 1 1];
    elseif (x(i)>-4 && x(i)<=-3)
        xq(i) = -3.5;
        e=[0 0 0];
    elseif (x(i)>-3 && x(i)<=-2)
        xq(i) = -2.5;
        e=[0 0 1];
    elseif (x(i)>-2 && x(i)<=-1)
        xq(i) = -1.5;
        e=[0 1 0];
    elseif (x(i)>-1 && x(i)<=0)
        xq(i) = -0.5;
        e=[0 1 1];
    end
    enc=[enc e];
end

subplot(3,2,2);
plot(t, xq, 'm-');
xlabel('time');
ylabel('amplitude');
title('Uniform Quatized Signal');

subplot(3,2,3);
plot(x, x-xq, 'r-');
xlabel('originnal sample amplitude');
ylabel('error amplitude');
title('Quantization Error');

% pcm Reciver
rec=enc; % received bit
xq_r=[];
for j=1:3:length(rec)-2
    if rec(j)==0 && rec(j+1)==0 && rec(j+2)==0
      xq1=-3.5;
    elseif  rec(j)==0 && rec(j+1)==0 && rec(j+2)==1
      xq1=-2.5;
    elseif rec(j)==0 && rec(j+1)==1 && rec(j+2)==0
      xq1=-1.5;
    elseif rec(j)==0 && rec(j+1)==1 && rec(j+2)==1
      xq1=-0.5;
    elseif rec(j)==1 && rec(j+1)==0 && rec(j+2)==0
      xq1=0.5;
    elseif rec(j)==1 && rec(j+1)==0 && rec(j+2)==1
      xq1=1.5;
    elseif rec(j)==1 && rec(j+1)==1 && rec(j+2)==0
      xq1=2.5;
    elseif rec(j)==1 && rec(j+1)==1 && rec(j+2)==1
      xq1=3.5;
    end
    xq_r=[xq_r xq1];
end

subplot(3,2,4);
plot(t, xq_r, 'y-');
xlabel('Time');
ylabel('amplitude');
title('Demapped signal');

% low pass filtering
[num den]=butter(5,4*fm/fs); %butterworth LPF
rec_op=filter(num,den,xq_r); %smoothing

subplot(3,2,5);
plot(t, rec_op, 'g-');
xlabel('Time');
ylabel('Amplitude');
title('Recostructed signal');
