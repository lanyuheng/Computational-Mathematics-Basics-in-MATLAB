function [S,X1,D,A,val,k]=allf(f,n,x0,p,q)
persistent h
x=x0;X1=x0;S=1;epss=1;k=1;a=1;d=zeros(n,1);
A=a;D=d;
X=sym('x',[1,n]);
g=gradient(f);
grad1=double(subs(g,X,x'));
x1=x;h=eye(n);
if q==4||q==3
d=-h*grad1;
x=x+a*d;
elseif q==5
    d=-grad1;
    D=[D,d];
    x=x+a*d;
end
while(epss>1e-4&&k<=10000)
    grad0=grad1;
    d0=d;
    grad1=double(subs(g,X,x'));
    d=direction(grad1,grad0,f,x,x1,q,n,d0,h,D,k);
    epss=norm(grad1);
    a=step(grad1,f,x,d,p,n,X);
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
end
