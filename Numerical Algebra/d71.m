clc;clear;
for i=50:100
    a1=diag(4*ones(1,i));
    a2=diag(ones(1,i-1),-1);
    a3=diag(ones(1,i-1),1);
    a=a1+a2+a3;
end
[D,V]=jacobi2(a);