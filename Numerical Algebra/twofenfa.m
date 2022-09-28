function [x,x1]=twofenfa(a,m)
k=1;n=length(a);
l=-norm(a,'inf');
u=norm(a,'inf');
while k<=100&&abs(l-u)>10^(-5)
    s=sn((l+u)/2,diag(a),[0,-ones(1,99)]);
    if(s>=m)
        u=(l+u)/2;
    else
        l=(l+u)/2;
    end
    k=k+1;
end
x=(l+u)/2;
[m,x1,k]=powerw(a-x*eye(n));