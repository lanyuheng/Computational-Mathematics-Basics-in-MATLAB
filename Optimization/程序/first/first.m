clc;clear;
%参数q-选择方向
% 1-最速下降法
% 2-牛顿法
% 3-DFP法
% 4-BFGS法
% 5-共轭梯度法
q=5;
n=100;
a=unidrnd(10,n,1);
g=a*(a')+unidrnd(5)*eye(n);
b=g*ones(n,1);
X=sym('x',[1,n]);
f=(X*g*X')./2+b'*X';
x0=zeros(n,1);
x=x0;X1=x0;S=1;epss=1;k=1;a=1;d=zeros(n,1);A=a;D=d;
grad1=g*x+b;
x1=x;h=eye(n);
if q==4||q==3
d=-h*grad1;
x=x+a*d;
elseif q==5||q==6
    d=-grad1;
    D=[D,d];
    x=x+a*d;
end
while(epss>1e-4&&k<=10000)
    grad0=grad1;
    d0=d;
    grad1=g*x+b;
    switch q
    case 1
        d=-grad1;
    case 2
        d=-inv(g)*grad1;
    case 3
        y=grad1-grad0;
        t=x-x1;
        h=h-(h*y*y'*h)/(y'*h*y)+(t*t')/(t'*y);
        d=-h*grad1;
    case 4
        y=grad1-grad0;
        t=x-x1;
        h=h-(h*y*y'*h)/(y'*h*y)+(t*t')/(t'*y);
        h=h';
        d=-h*grad1;
    case 5
        b1=norm(grad1)^2/norm(grad0)^2;
        d=-grad1+b1*d0;
    end
    epss=norm(grad1);
    a=-(grad1'*d)/(d'*g*d);
    x1=x;
    x=x+a*d;
    k=k+1;
    X1=[X1,x1];
    S=[S,epss];
    A=[A,a];
    D=[D,d];
    epss
end
val=subs(f,X,x');
K=0:1:k-2;
% s=log10(s);
% x=log10(x);
% d=log10(d);
% a=log10(a);
hold on;
subplot(2,2,1);
plot(K,S(2:k));
legend('梯度范数')
subplot(2,2,2);
plot(K,X1(:,1:k-1)');
legend('x取值')
subplot(2,2,3);
plot(K,D(:,2:k)');
legend('下降方向')
subplot(2,2,4);
plot(K(1:k-2),A(2:k-1));
legend('步长')