function [m,x,k]=powerw(A)
    n=length(A);x=ones(n,1);
    k=0;m1=0;N=500;
while k<=N
    v=A*x;
    [vmax,i]=max(abs(v));
    m=v(i);x=v/m;
    if abs(m-m1)<10^(-5)
        break;
    end
    m1=m;k=k+1;
end