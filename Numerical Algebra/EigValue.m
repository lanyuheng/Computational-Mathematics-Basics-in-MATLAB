function r=EigValue(A)%计算A的特征值,特征向量
n=size(A);
n=n(2);
r=zeros(1,n);
y=zeros(1,n-1);%y用来储存次对角线元素
for i=1:n-1
y(i)=A(i+1,i);
end
m=0;
for i=1:n-1
if abs(y(i)-0)<1e-5
m=m+1;
end
end
if m==0
x=1;
else
z=zeros(1,m);%z用来储存值为0的y向量的角标。
j=1;
i=1;
while(i<n)
    if abs(y(i)-0)<1e-5
    z(j)=i;
    j=j+1;
end
i=i+1;
end
end
if z(1)==2%次对角线第一个等于0的元素的位置不同,需要2分类讨论
p=[1,A(1,1)+A(2,2),A(1,1)*A(2,2)-A(1,2)*A(2,1)]
r(1:2)=roots(p);%求2*2矩阵的特征值
j=1;
while j<m
if z(j+1)-z(j)==1
    r(z(j+1))=A(z(j+1),z(j+1));
end
if(z(j+1)-z(j)==2)
p=[1,-(A(z(j+1)-1,z(j+1)-1)+A(z(j+1),z(j+1))),A(z(j+1)-1,z(j+1)-1 )*A(z(j+1),z(j+1))-A(z(j+1)-1,z(j+1))*A(z(j+1),z(j+1)-1)];
r((z(j+1)-1):z(j+1))=roots(p);
end
j=j+1;
end
if n-z(m)==1
r(n)=A(n,n);
else
p=[1,-(A(n-1,n-1)+A(n,n)),A(n-1,n-1)*A(n,n)-A(n-1,n)*A(n,n-1)];
r(n-1:n)=roots(p);
end
else
r(1)=A(1,1);
j=1;
while j<m
if z(j+1)-z(j)==1
r(z(j+1))=A(z(j+1),z(j+1));
end
if(z(j+1)-z(j)==2)
p=[1,-(A(z(j+1)-1,z(j+1)-1)+A(z(j+1),z(j+1))),A(z(j+1)-1,z(j+1)-1 )*A(z(j+1),z(j+1))-A(z(j+1)-1,z(j+1))*A(z(j+1),z(j+1)-1)];
r((z(j+1)-1):z(j+1))=roots(p);
end
j=j+1;
end
if n-z(m)==1
r(n)=A(n,n);
else
p=[1,-(A(n-1,n-1)+A(n,n)),A(n-1,n-1)*A(n,n)-A(n-1,n)*A(n,n-1)];
r(n-1:n)=roots(p);
end
end