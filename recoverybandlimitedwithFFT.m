fs=21;
N=50;
Ts = 1/fs;
tn = Ts*(-N:1:N);
tdash=tn';

randn('state',7)
a=0.25*randn(10,1);
s=zeros(N*2+1,1);
for i=1:10
    s1=1*sin(2*pi*(i)*tdash);
    s=s+s1;
end


t = -1:2/999:1;
xh = 0;
for i = 1:(2*N+1),
    n = i - N - 1;
    tw = (t - n*Ts)/Ts;
    xh = xh + s(i)*sinc(tw(:));
end
plot(t,xh,'-','linewidth',1.5)
ss=zeros(1000,1);

for i=1:10
    s2=1*sin(2*pi*(i)*t);
    ss=ss+s2;
end
hold on;
plot(t,ss','--','linewidth',1.5)
axis([-1 1 -2 2])
% title('(a) Comparing x-hat(t)(solid line) with x(t)(dashed line): fs = 1 Hz, 25 samples')
xlabel('Time in seconds')
grid

Y = fft(xh);
L=1000;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
figure
Fs=fs;
f = Fs*(0:(L/2))/L;
P1(2:end-1) = 2*P1(2:end-1);
plot(f,P1,'-','linewidth',1.5)

figure
Y = fft(ss(1,:));
L=1000;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
Fs=fs;
f = Fs*(0:(L/2))/L;
P1(2:end-1) = 2*P1(2:end-1);
plot(f,P1,'--','linewidth',1.5)

