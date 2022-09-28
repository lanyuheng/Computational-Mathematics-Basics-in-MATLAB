function x=liegauss(a,b)
n=size(a);
n=n(1);
p=diag(ones(1,n));
for k=1:n-1
    p1=a(k:n,k);
    [s,t]=max(p1);
    t=t+k-1;
    a([k,t],:)=a([t,k],:);
    q=diag(ones(1,n));
    q([k,t],:)=q([t,k],:);
    p=q*p;
    if a(k,k)==0
        break;
    else
    a(k+1:n,k)=a(k+1:n,k)/a(k,k);
    a(k+1:n,k+1:n)=a(k+1:n,k+1:n)-a(k+1:n,k)*a(k,k+1:n);
    end
end
l=tril(a,-1)+diag(ones(1,n));
u=triu(a);
y=forward(l,p*b);
x=back(u,y);