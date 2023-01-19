
M=4
x=-10:.001:10;
y=M*sinc(M*x)-(M-1)*sinc((M-1)*x);
plot(y);
wav=