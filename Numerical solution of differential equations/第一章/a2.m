function odesolver(ft,t0,T,h)
% clear all
% clc
% t0=0;T=5;
% h=0.1;
t=(t0:h:T);
n=length(t);
ExactU=c1D(t,ft);


% 5）二步法a=0,二步显式法，u(n+2)-(1+a)*u(n+1)+a*u(n)=(1/2)*h*((3-a)*f(n=1)-(1+a)*f(n))
u=0.*t;
u(1)=ExactU(1);
u(2)=ExactU(2);
a=0;
tic;
for i=3:n
    u(i)=(1+a)*u(i-1)-a*u(i-2)+(1/2)*h*((3-a)*f1D(t(i-1),u(i-1),ft)-(1+a)*f1D(t(i-2),u(i-2),ft));
end
time5=toc;
NumU5=u;
Err5=(NumU5(n)-ExactU(n));
RelErr5=Err5/ExactU(n);

% 6）二步法a=-5,二步显式法，u(n+2)-(1+a)*u(n+1)+a*u(n)=(1/2)*h*((3-a)*f(n=1)-(1+a)*f(n))
u=0.*t;
u(1)=ExactU(1);
u(2)=ExactU(2);
a=-5;
tic;
for i=3:n
    u(i)=(1+a)*u(i-1)-a*u(i-2)+(1/2)*h*((3-a)*f1D(t(i-1),u(i-1),ft)-(1+a)*f1D(t(i-2),u(i-2),ft));
end
time6=toc;
NumU6=u;
Err6=(NumU6(n)-ExactU(n));
RelErr6=Err6/ExactU(n);



%画图
figure;
plot(t,ExactU,'k-*',t,NumU5,'r-d',t,NumU6,'g-d');
legend('精确解','二步法a=0','二步法a=-5','location','northeastoutside');

%制表
f=figure;
data=([t;ExactU;NumU5;NumU6])';
data=[data;[0,0,Err5,Err6];[0,0,RelErr5,RelErr6];[0,0,time5,time6]];
colnames={'t','精确解','二步法a=0','二步法a=-5'};
tab=uitable(f,'Data',data,'ColumnName',colnames,'Position',[50 50 800 500]);