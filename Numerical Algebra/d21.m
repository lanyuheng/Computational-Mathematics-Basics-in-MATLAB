clc;clear;
v1=zeros(1,16);
v2=zeros(1,16);
for i0=5:20
    a=zeros(i0);
    for i=1:i0
        for j=1:i0
        a(i,j)=1/(i+j-1);
    end
    end
    v1(i0-4)=normin(a);
    v2(i0-4)=max(sum(a'));
end
v=(v1.*v2)';