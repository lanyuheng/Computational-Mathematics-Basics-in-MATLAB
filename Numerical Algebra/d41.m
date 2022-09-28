clc;clear;
c=1
a=1/2;n=100;h=1/n;
w=1/2;N=1000000;
A=-(2*c+h)*eye(n-1);
for i=2:n-1
    A(i-1,i)=c+h;
    A(i,i-1)=c;
end
b=[a*h^2*ones(n-2,1);a*h^2-(c+h)];
for i=1:n-1
    x(i)=i*h;
    y(i)=((1-a)/(1-exp(-1/c)))*(1-exp(-x(i)/c))+a*x(i);
end
[y1,n1]=jacobi(A,b,N);
[y2,n2]=gs(A,b,N);
[y3,n3]=sor(A,b,w,N);

