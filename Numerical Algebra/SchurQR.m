function r=SchurQR(A)
%向量r用来储存特征值
%Hessenberg分解:
[m,m]=size(A);
for k=1:m-2
[v,b]=house(A(k+1:m,k));
H1= eye(m-k)-b*v*v';
H2=eye(m);
for i=k+1:m
for j=k+1:m
H2(i,j)=H1(i-k,j-k);
end
end
if k==1;
H=H2;
else
H=H*H2;
end
A(k+1:m,k:m)=H1*A(k+1:m,k:m);
A(1:m,k+1:m)= A(1:m,k+1:m)*H1;
end
u=10e-5;
for i=2:m;
if abs( A(i,i-1))<=(abs(A(i,i))+ abs(A(i-1,i-1)))*u; A(i,i-1)=0;
end
end
%QR迭代:
H22=A;
x=Ifreducible(H22);
while x==1
H22=Francis(H22);
x=Ifreducible(H22);
end
r=EigValue(H22);