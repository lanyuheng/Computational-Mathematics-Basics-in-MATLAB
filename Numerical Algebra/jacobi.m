function [x,k]=jacobi(A,b)
D=diag(diag(A));
L=triu(A)-A;
U=tril(A)-A;B=D^(-1)*(L+U);
g=D^(-1)*b;
x0=zeros(length(A),1);
x=B*x0+g;
k=1;
while norm(x-x0,2)>=0.00001
    x0=x;
    x=B*x0+g;
    k=k+1;
    if k>=1000000
        break
    end
end
end