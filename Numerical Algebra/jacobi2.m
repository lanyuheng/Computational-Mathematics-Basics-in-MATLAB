function [D,V]=jacobi2(A)
b=size(A);
n=max(b)
D=eye(n);
V=eye(n);
p=0;q=0;
maxpq=0;
for i=1:n-1
    for j=i+1:n
        if abs(A(i,j))>abs(maxpq)
            maxpq=A(i,j);
            p=i;
            q=j;
        end
    end
    while abs(maxpq)>eps
        maxpq=0;
        phi=atan2(2*A(p,q),A(p,p)-A(q,q))/2;
        U=eye(n);
        U(p,p)=cos(phi);
        U(q,q)=cos(phi);
        U(p,q)=-sin(phi);
        U(q,p)=sin(phi);
        D=U'*A*U;
        V=V*U;
        A=D;
        for i=1:n-1
            for j=i+1:n
                if abs(A(i,j))>abs(maxpq)
                    maxpq=A(i,j);
                    p=i;
                    q=j;
                end
            end
        end
    end
end
D=diag(D);
        