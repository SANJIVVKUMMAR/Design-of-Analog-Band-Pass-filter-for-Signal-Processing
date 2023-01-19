% To reconstruct the continuous-time function x(t) in
% On time interval [-4, 4] using samples

% Get samples x[n]
fs=60;
N=96;
Ts = 1/fs;
tn = Ts*(-N:1:N);
xn1 = 5 + 1.5*sin(0.2*pi*tn) + 1.3*cos(0.4*pi*tn);
xn2 = -0.9*sin(0.5*pi*tn) - 0.5*cos(0.6*pi*tn);
xn = xn1 + xn2;
% Use formula (2.12) to construct x_hat(t) on [-4, 4]
t = -4:8/499:4;
xh = 0;
for i = 1:(2*N+1),
    n = i - N - 1;
    tw = (t - n*Ts)/Ts;
    xh = xh + xn(i)*sinc(tw(:));
end
% Evaluate x(t) on [-4, 4] and comparison with x_hat(t)
x1 = 5+1.5*sin(0.2*pi*t)+1.3*cos(0.4*pi*t);
x2 = -0.9*sin(0.5*pi*t)-0.5*cos(0.6*pi*t);
x = x1 + x2;
x = x(:);
figure(1)
plot(t,xh,'-','linewidth',1.5)
hold on
plot(t,x,'--','linewidth',1.5)
axis([-4 4 -2 8])
% title('(a) Comparing x-hat(t)(solid line) with x(t)(dashed line): fs = 1 Hz, 25 samples')
xlabel('Time in seconds')
grid
hold off