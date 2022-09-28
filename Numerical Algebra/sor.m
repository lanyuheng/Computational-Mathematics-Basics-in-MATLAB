function [x,k]=sor(A,b,w)
D=diag(diag(A));
L=D-tril(A);
U=D-triu(A);
x0=zeros(length(A),1);
B=(D-w*L)^(-1)*((1-w)*D+w*U);
g=w*(D-w*L)^(-1)*b;
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