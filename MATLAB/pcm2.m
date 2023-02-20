%PCM
%Analog signal
f=2; % max freq inn input
fs=1000*f; % Nyquist sampling rate
t=0:1/fs:1; %time
a=10; % amplitude
x=a*sin(2*pi*f*t);

% original signal
subplot(4,1,1)
plot(t,x,'r-');
title('Original Signal');
xlabel('Time');
ylabel('Amplitude')


%level shifting
xq=x+a;

% Quantization
q_op=round(xq);

% Transmited signal
subplot(4,1,2)
plot(t,q_op,'g-');
title('Transmited signal');
xlabel('Time');
ylabel('Amplitude')

%decimal to binnary  convertion
enco=de2bi(q_op,'left-msb');

% pcm reciver
deco=bi2de(enco,'left-msb');

%shifting the amplitude level to the original value
xr=deco-a;

% reconstructed signal
subplot(4,1,3)
plot(t,xr,'b-');
title('Reconstructed Signal');
xlabel('Time');
ylabel('Amplitude')

% low pass filtering
[num den]=butter(5,4*fm/fs); %butterworth LPF
rec_op=filter(num,den,xr); %smoothing

subplot(4,1,4);
plot(t, rec_op, 'g-');
xlabel('Time');
ylabel('Amplitude');
title('Recieved signal');
