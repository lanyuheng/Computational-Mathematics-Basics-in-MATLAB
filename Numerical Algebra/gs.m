function [x,k]=gs(A,b);
U=diag(diag(A))-triu(A);
x0=zeros(length(A),1);
B=tril(A)^(-1)*U;
g=tril(A)^(-1)*b;
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