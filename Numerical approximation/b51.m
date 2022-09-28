clc;clear;
x=linspace(0,1,1000);
p0=[-1,0];p1=[0,1];p2=[1,1];p3=[2,0];
p=[p0;p1;p2;p3]';
P=zeros(2,1000);
B=zeros(4,1000);
B(1,:)=nchoosek(3,0).*(x.^0).*(1-x).^(3-0);
B(2,:)=nchoosek(3,1).*(x.^1).*(1-x).^(3-1);
B(3,:)=nchoosek(3,2).*(x.^2).*(1-x).^(3-2);
B(4,:)=nchoosek(3,3).*(x.^3).*(1-x).^(3-3);
for i=1:1000
    for j=1:4
        P(:,i)=P(:,i)+p(:,j).*B(j,i);
    end
end
plot(p(1,:),p(2,:),'o-g');
hold on
plot(P(1,:),P(2,:),'r');