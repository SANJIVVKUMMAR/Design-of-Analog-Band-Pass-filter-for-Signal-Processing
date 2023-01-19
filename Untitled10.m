
fs=25;
N=200;
Ts = 1/fs;
tn = Ts*(-N:1:N);
tdash=tn';

randn('state',7)
a=0.25*randn(10,1);
s=zeros(2*N+1,1);
for i=1:5
    s1=a(i)*sin(2*pi*(20+i)*tdash);
    s=s+s1;
end

ss=zeros(1000,1);
t = -1:2/999:1;
xh = 0;
for i=1:5
    s1=a(i)*sin(2*pi*(20+i)*t);
    ss=ss+s1;
end


M=2;
for i = 1:(2*N+1),
    n = i - N - 1;
    tw1 = M*(t - n*Ts)/Ts;
    tw2 = (M-1)*(t - n*Ts)/Ts;
    xh = xh + s(i)*(M*sinc(tw1(:)) -  (M-1)*sinc( tw2(:) ));
end

plot(t,xh,'-','linewidth',1.5)
hold on;
plot(t,ss','--','linewidth',1.5)
axis([-0.15 0.15 -2 2])
% title('(a) Comparing x-hat(t)(solid line) with x(t)(dashed line): fs = 1 Hz, 25 samples')
xlabel('Time in seconds')
grid


Y = fft(xh);
L=1000;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
figure
Fs=500;
f = Fs*(0:(L/2))/L;
P1(2:end-1) = 2*P1(2:end-1);
plot(f,P1) 
hold on;

Y1=fft(ss(1,:));
P2 = abs(Y1/L);
P1 = P2(1:L/2+1);
figure
Fs=500;
f = Fs*(0:(L/2))/L;
P1(2:end-1) = 2*P1(2:end-1);
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of ')
xlabel('f (Hz)')
ylabel('|P1(f)|')












