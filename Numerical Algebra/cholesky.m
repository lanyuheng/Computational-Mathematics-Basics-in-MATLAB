function x=cholesky(a,b)
n=size(a);
n=n(1);
for k=1:n
    a(k,k)=a(k,k).^(1/2);
    a(k+1:n,k)=a(k+1:n,k)/a(k,k);
    for j=k+1:n
        a(j:n,j)=a(j:n,j)-a(j:n,k)*a(j,k);
    end
end
l=tril(a);
y=forward(l,b);
x=back(l',y);
