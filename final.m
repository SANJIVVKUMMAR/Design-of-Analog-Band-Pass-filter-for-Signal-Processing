%Sampling frequency is fs=8Hz, since fs>=2(Fh-Fl)

fs=8;
N=10;
Ts = 1/fs;
tn = Ts*(-N:1:N);
tdash=tn';

randn('state',2)
a=0.25*randn(4,1);
s=zeros(2*N+1,1);
%formula to construct signal with sum sin wave with frequency from 200 to 204
for i=1:4
    s1=a(i)*sin(2*pi*(200+i)*tdash);
    s=s+s1;
end

ss=zeros(1000,1);
t = -1:2/999:1;

for i=1:4
    s1=a(i)*sin(2*pi*(200+i)*t);
    ss=ss+s1;
end


%M =2Fm/8; So M=51
M=51;
xh = 0;
%Formula for computing reconstuction of bandpass signal 
for i = 1:(2*N+1),
    n = i - N - 1;
    tw1 = M*(t - n*Ts)/Ts;
    tw2 = (M-1)*(t - n*Ts)/Ts;
    xh = xh + s(i)*(M*sinc(tw1(:)) -  (M-1)*sinc( tw2(:) ));
end

%Plot of both orginal and reconstucted
plot(t,xh,'-','linewidth',1.5)
hold on;
plot(t,ss','--','linewidth',1.5)
axis([-0.05 0.05 -2 2])
xlabel('Time in seconds')
grid

%FFT of reconstructed signal
Y = fft(xh);
L=1000;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
figure
Fs=500;
f = Fs*(0:(L/2))/L;
P1(2:end-1) = 2*P1(2:end-1);
plot(f,P1) 
title('FFT of reconstructed signal')
xlabel('f (Hz)')
ylabel('Amplitude')

%FFT of orginal signal
Y1=fft(ss(1,:));
P2 = abs(Y1/L);
P1 = P2(1:L/2+1);
figure
Fs=500;
f = Fs*(0:(L/2))/L;
P1(2:end-1) = 2*P1(2:end-1);
plot(f,P1) 
title('FFT of orginal signal')
xlabel('f (Hz)')
ylabel('Amplitude')












