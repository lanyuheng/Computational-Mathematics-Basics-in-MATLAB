function creatfigure(f,x,s,k)
x1=linspace(-3,3);
y1=linspace(-3,3);
[X,Y]=meshgrid(x1,y1);
Z=(1-X).^2+100*(Y-X.^2).^2;
subplot(2,1,1);
contour(X,Y,Z,100);
hold on
subplot(2,1,1);
plot(x(1,:),x(2,:),'*');
subplot(2,1,2);
surf(X,Y,Z);
end