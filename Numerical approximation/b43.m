clc;clear;
format long
syms x
f=8/(1+x.^2);
x1=linspace(0,1,3);
h=(1-0)/2;
y1=0;
for i=1:2
    d=(x1(i+1)-x1(i))/4;
    x3(i)=2*d+x1(i);
    x2(i)=d+x1(i);
    x4(i)=3*d+x1(i);
end
for i=1:2
    y1=double(y1+(h/90)*(7*subs(f,x,x1(i))+32*subs(f,x,x2(i))+12*subs(f,x,x3(i))+32*subs(f,x,x4(i))+7*subs(f,x,x1(i+1))));
end
y1
int(f,x,0,1)