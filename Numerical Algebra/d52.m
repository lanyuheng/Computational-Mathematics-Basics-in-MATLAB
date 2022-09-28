clc;clear;
a=zeros(40);
b=zeros(40,1);
for i=1:40
    for j=1:40
        a(i,j)=1/(i+j-1);
        b(i)=b(i)+a(i,j);
    end
    b(i)=b(i)/3;
end
x=zeros(40,1);
[x,k]=cg(a,b,x);