clc;clear;
x=1:1:9;
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
x0=linspace(1,9,1000);
syms x1
w1=1;
for i=1:9
    w1=w1.*(x1-i);
end
w1=gradient(w1);
w=1;
for i=1:9
    w=w.*(x0-i);
end
L=zeros(9,1000);
for i=1:9
    L(i,:)=w./((x0-x(i)).*double(subs(w1,x1,i)));
end
plot(x0,L(1,:));
hold on
for i=2:9
    a=rand(1,3);
    plot(x0,L(i,:),'color',a)
end