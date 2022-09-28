clc;clear;
x=linspace(0,1,1000);
f=(x.^4+1).*sin(pi.*x);
b=0;
B=zeros(4,1000);
B(1,:)=nchoosek(3,0).*(x.^0).*(1-x).^(3-0);
B(2,:)=nchoosek(3,1).*(x.^1).*(1-x).^(3-1);
B(3,:)=nchoosek(3,2).*(x.^2).*(1-x).^(3-2);
B(4,:)=nchoosek(3,3).*(x.^3).*(1-x).^(3-3);
for i=1:3
    b=b+(i/3).*f.*B(i,:);
end
plot(x,b,'r');
hold on
plot(x,f,'g');