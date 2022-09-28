function u=normin(b)
k=1;
n=size(b);
n=n(1);
x=ones(n,1);
x=x/n;
while k==1
    w=liegauss(b',x);
    v=sign(w);
    z=liegauss(b,v);
    [s,t]=max(abs(z));
    if s<=z'*x
        u=sum(abs(w));
        k=0;
    else
        x=zeros(n,1);
        x(t)=1;
    end
end