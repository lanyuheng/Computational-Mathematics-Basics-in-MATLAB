function [m,x,k]=powerm(n,a)
A=zeros(n);
N=500;
for i=1:n
    A(i,n)=-a(i);
end
for i=2:n
    for j=1:n-1
        if i-j==1
            A(i,j)=1;
        end
    end
end
n=length(A);x=ones(n,1);
k=0;m1=0;
while k<=N
    v=A*x;
    [vmax,i]=max(abs(v));
    m=v(i);x=v/m;
    if abs(m-m1)<10^(-5)
        break;
    end
    m1=m;k=k+1;
end
