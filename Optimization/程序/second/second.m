clc;clear;
%����q-ѡ����
% 1-�����½���
% 2-ţ�ٷ�
% 3-DFP��
% 4-BFGS��
% 5-�����ݶȷ�
q=2;
n=143;
c0=0.1;r=0.5;
x0=zeros(n,1);
x=x0;X1=x0;S=1;epss=1;k=1;a=1;
d=zeros(n,1);
% d=2*ones(n,1);
A=a;D=d;
grad1=gr1(x,n);
x1=x;h=eye(n);
if q==4||q==3
d=-h*grad1;
x=x+a*d;
elseif q==5||q==6
    d=-grad1;
    D=[D,d];
    x=x+a*d;
end
Z=0;
while(epss>1e-4&&k<=100000)
    grad0=grad1;
    d0=d;
    grad1=gr1(x,n);
    switch q
    case 1
        d=-grad1;
    case 2
        d=-inv(gr2(x,n))*grad1;
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
    a=1;z=1;
    while(z>0)
            a=a*r;
            z=gr0(x+a*d,n)-gr0(x,n)-c0*a*grad1'*d;
    end
    Z=[Z,z];
    x1=x;
    x=x+a*d;
    k=k+1;
    X1=[X1,x1];
    S=[S,epss];
    A=[A,a];
    D=[D,d];
    epss
end
val=gr0(x,n);
K=0:1:k-2;
% s1=log10(s);
% x1=log10(x);
% d1=log10(d);
% a1=log10(a);
figure(1)
hold on;
subplot(2,2,1);
plot(K,(S(2:k)));
legend('�ݶȷ���')
subplot(2,2,2);
plot(K,(X1(:,1:k-1)'));
legend('xȡֵ')
subplot(2,2,3);
plot(K,(D(:,2:k)'));
legend('�½�����')
subplot(2,2,4);
plot(K(1:k-2),(A(2:k-1)));
%�����ݶ�����������ı仯,�����ݶ�ȡ�˶���
legend('����')
figure(2)
plot(K,(Z(1:k-1)));