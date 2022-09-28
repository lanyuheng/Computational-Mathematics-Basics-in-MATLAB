function x=qrfj(b,A)
[m,n]=size(A);
Q=eye(m);
for j=1:n
    if j<m
        [v,b1]=house(A(j:m,j));
        A(j:m,j:n)=(diag(ones(1,m-j+1))-b1*v*v')*A(j:m,j:n);
        d(j)=b1;
        A(j+1:m,j)=v(2:m-j+1);
    end
end
R=triu(A(1:n,:));
for j=1:n
    if j<m
        H=eye(m);
        t=[1;A(j+1:m,j)];
        H(j:m,j:m)=H(j:m,j:m)-d(j)*t*t';
        Q=Q*H;
    end
end
n=size(A);
n=n(2);
c=Q'*b;
x=back(R(1:n-1,1:n-1),c(1:n-1));
x(n)=c(n)-R(n,1:n-1)*x;
end