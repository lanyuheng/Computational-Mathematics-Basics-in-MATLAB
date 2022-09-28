clc;clear;
c=10^(-7);
n=20;
N=1000000;
h=1/n;
A=zeros((n-1)^2);
b=zeros((n-1)^2,1);
for i=1:(n-1)^2
    if i>1
        A(i-1,i)=-1;
        A(i,i-1)=-1;
    end
    if i>n-1
        A(i,i-n+1)=-1;
        A(i-n+1,i)=-1;
    end
    ii=ceil(i/(n-1));
    if mod(i,n-1)~=0
        jj=mod(i,n-1);
    else
        jj=n-1;
    end
    A(i,i)=4+exp(ii*jj*h^2);
    b(i)=h^3*(ii+jj);
    if ii==1||ii==n-1
        b(i)=b(i)+1;
    end
    if jj==1||jj==n-1
        b(i)=b(i)+1;
    end
end
disp(['n=',num2str(n)])
tic
[y,k]=gs(A,b,N);
toc
disp(['迭代次数为',num2str(k)]);