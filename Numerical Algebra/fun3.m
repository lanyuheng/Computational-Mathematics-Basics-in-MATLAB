function a=fun3(n)

a1=-ones(n);
a1=tril(a1,-1);
a2=diag(ones(1,n));
a=a1+a2;
for i=1:n-1
    a(i,n)=1;
end
end