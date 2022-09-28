function [x,k]=cg(A,b,x)
x0=x;
r=b-A*x;
r1=r;k=0;
while norm(r1,1)>=10^(-7)&&k<10^4
    k=k+1;
    if k==1
        p=r;
    else
        b=(r1'*r1)/(r'*r);
        p=r1+b*p;
    end
    r=r1;
    w=A*p;
    a=(r'*r)/(p'*w);
    x=x+a*p;
    r1=r-a*w;
end
