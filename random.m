t=-1:0.001:1-0.001;
tdash=t';
r1=sin(2*pi*2*t);%95hz
r2=sin(2*pi*100*t);%100hz

randn('state',7)
a=0.25*randn(10,1);
s=zeros(2000,1);
for i=1:10
    s1=a(i)*sin(2*pi*(95+i)*tdash);
    %s2=b(i)*cos(2*pi*(i-0.5)*t);
    s=s+s1;
end
figure
plot(abs(fft(s,2000)))

plot(1000*t(1:50),s(1:50))
xlabel('t (milliseconds)')
ylabel('X(t)')
Y = fft(s);
L=2000;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
figure
Fs=1000;
f = Fs*(0:(L/2))/L;
plot(f,P1) 
P1(2:end-1) = 2*P1(2:end-1);
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')




