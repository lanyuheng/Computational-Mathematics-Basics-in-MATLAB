clc;clear;
x2=1:1:9;
y=zeros(1,9);
y(1)=2;
y(2)=0;
y(3)=1;
y(4)=6;
y(5)=8;
y(6)=6;
y(7)=0;
y(8)=4;
y(9)=3;
syms x1 x
w1=1;
for i=1:9
    w1=w1.*(x1-i);
end
w1=gradient(w1);
w=1;
for i=1:9
    w=w.*(x-i);
end
L=sym('x',[1,9]);
for i=1:9
    L(i)=w/((x-x2(i))*double(subs(w1,x1,i)));
end
l=0;
for i=1:9
    l=l+y(i)*L(i);
end
l