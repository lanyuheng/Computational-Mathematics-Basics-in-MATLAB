clc;clear;
syms x
f=8/(1+x.^2);
x1=linspace(0,1,9);
h=(1-0)/8;
y1=(h/2)*(double(subs(f,x,0))+double(subs(f,x,1)));
for i=2:8
    y1=y1+h*double(subs(f,x,x1(i)));
end
y1
int(f,x,0,1)