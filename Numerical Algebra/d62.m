clc;clear;
x=1.0;
A=[9.1,3.0,2.6,4.0;4.2,5.3,4.7,1.6;3.2,1.7,9.4,x;6.1,4.9,3.5,6.2];
r1=SchurQR(A);
a=zeros(1,42);
a(1)=1;a(4)=1;a(42)=1;
A=zeros(41);
n=41;
for i=1:n
    A(i,n)=-a(i);
end
for i=2:n
    for j=1:n-1
        if i-j==1
            A(i,j)=1;
        end
    end
end
r2=SchurQR(A);