clc;clear;
syms x
y=x.^3+7*x+1;
x1=zeros(1,20);
y1=zeros(1,20);
for i=1:20
    x1(i)=i/20;
    y1(i)=double(subs(y,x,x1(i)))+((-1).^(i))*(1e-4);
end
f1=ones(1,20);
f2=x1;
f3=x1.^2;
f4=x1.^3;
A=zeros(4,4);
A(1,1)=f1*f1';
A(1,2)=f1*f2';
A(1,3)=f1*f3';
A(1,4)=f1*f4';
A(2,1)=A(1,2);
A(2,2)=f2*f2';
A(2,3)=f2*f3';
A(2,4)=f2*f4';
A(3,1)=A(1,3);
A(3,2)=A(2,3);
A(3,3)=f3*f3';
A(3,4)=f3*f4';
A(4,1)=A(1,4);
A(4,2)=A(2,4);
A(4,3)=A(3,4);
A(4,4)=f4*f4';
b(1)=f1*y1';
b(2)=f2*y1';
b(3)=f3*y1';
b(4)=f4*y1';
b=b';
x2=A\b;
s=x2(1)+x2(2)*x+x2(3)*x.^2+x2(4)*x.^3;
x0=linspace(0,1,1000);
y=zeros(1,1000);
for i=1:1000
    y(i)=subs(s,x,x0(i));
end
plot(x0,y,'r');
hold on
plot(x1,y1,'b');