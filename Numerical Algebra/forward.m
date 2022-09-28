function b=forward(l,b)

n=size(l);
n=n(1);
for j=1:n-1
    b(j)=b(j)/l(j,j);
    b(j+1:n)=b(j+1:n)-b(j)*l(j+1:n,j);
end
b(n)=b(n)/l(n,n);
end