clc;clear;
x=linspace(0,1,100);
y=linspace(0,1,100);
a=zeros(3,3,3);
a(1,1,:)=[0,0,1];a(2,1,:)=[1,0,1.5];a(3,1,:)=[2,0,1];
a(1,2,:)=[0,1,1.5];a(2,2,:)=[1,1,2];a(3,2,:)=[2,1,1.5];
a(1,3,:)=[0,2,1];a(2,3,:)=[1,2,1.5];a(3,3,:)=[2,2,1];
m=zeros(3,1);
for i=1:3
    for j=1:3
        m=[m,reshape(a(i,j,:),3,1)];
     end
end
m=m(:,2:10);
P=zeros(100,100,3);
B=zeros(3,100);
B(1,:)=nchoosek(2,0).*(x.^0).*(1-x).^(2-0);
B(2,:)=nchoosek(2,1).*(x.^1).*(1-x).^(2-1);
B(3,:)=nchoosek(2,2).*(x.^2).*(1-x).^(2-2);
for i=1:100
for j=1:100
    for n=1:3
        for v=1:3
        P(i,j,:)=P(i,j,:)+a(n,v,:).*B(n,i).*B(v,j);
        end
    end
end
end
q=zeros(3,1);
for i=1:100
    for j=1:100
        q=[q,reshape(P(i,j,:),3,1)];
     end
end
q=q(:,2:10001);
x=q(1,:);y=q(2,:);z=q(3,:);
[X,Y]=meshgrid(linspace(0,2,100),linspace(0,2,100));
Z=griddata(x,y,z,X,Y)
h=surf(X,Y,Z)
set(h,'FaceColor',[1,0,0])
hold on
for i=[1 2 4 5 7 8]
    m1=m(:,[i i+1]);
    plot3(m1(1,:),m1(2,:),m1(3,:),'o-b');
end
for i=[1 2 3 4 5 6]
    m1=m(:,[i i+3]);
    plot3(m1(1,:),m1(2,:),m1(3,:),'o-b');
end
plot3(m(1,:),m(2,:),m(3,:),'og');