clc;clear;
format long
syms x
f=8/(1+x.^2);
x1=linspace(0,1,5);
h=(1-0)/4;
y1=0;
x2=zeros(1,3);
for i=1:4
    d=(x1(i+1)-x1(i))/2;
    x2(i)=d+x1(i);
end
for i=1:4
    y1=double(y1+(h/6)*(subs(f,x,x1(i))+4*subs(f,x,x2(i))+subs(f,x,x1(i+1))));
end
y1
int(f,x,0,1)