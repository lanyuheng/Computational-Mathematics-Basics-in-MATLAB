x=linspace(0,1,1000);
b0=nchoosek(3,0)*(x.^0).*(1-x).^(3-0);
b1=nchoosek(3,1)*(x.^1).*(1-x).^(3-1);
b2=nchoosek(3,2)*(x.^2).*(1-x).^(3-2);
b3=nchoosek(3,3)*(x.^3).*(1-x).^(3-3);
plot(x,b0,'b');
hold on
plot(x,b1,'g');
plot(x,b2,'r');
plot(x,b3,'c');