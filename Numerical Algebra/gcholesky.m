function x=gcholesky(a,b)
n=size(a);
n=n(1);
v=zeros(1,n)';
for j=1:n
    for i=1:j-1
        v(i)=a(j,i)*a(i,i)
    end
    a(j,j)=a(j,j)-a(j,1:j-1)*v(1:j-1);
    a(j+1:n,j)=(a(j+1:n,j)-a(j+1:n,1:j-1)*v(1:j-1))/a(j,j);
end
l=tril(a,-1)+diag(ones(1,n));
d=diag(diag(a));
y=forward(l,b);
x=back(d*l',y);
