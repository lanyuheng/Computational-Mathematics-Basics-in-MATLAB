clc;clear;
p=zeros(1,16);
v1=zeros(1,16);
v2=zeros(1,16);
for i0=5:30
    a=fun3(i0);
    x0=rand(1,i0);
    b=a*x0';
    x=liegauss(a,b);
    r=b-a*x;
    r1=sum(abs(r));
    b1=sum(abs(b));
    v1(i0-4)=normin(a);
    v2(i0-4)=max(sum(a'));
    p(i0-4)=(v1(i0-4)*v2(i0-4)*r1)/b1;
    p1(i0-4)=max(x-x0');
end
plot(1:26,p);
hold on
plot(1:26,p1);