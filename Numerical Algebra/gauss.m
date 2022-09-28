function x=gauss(a,b)
n=size(a);
n=n(1);
for k=1:n-1
    a(k+1:n,k)=a(k+1:n,k)/a(k,k);
    a(k+1:n,k+1:n)=a(k+1:n,k+1:n)-a(k+1:n,k)*a(k,k+1:n);
end
l=tril(a,-1)+diag(ones(1,n));
u=triu(a);
y=forward(l,b);
x=back(u,y);