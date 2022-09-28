function odesolver(ft,t0,T,h)
% clear all
% clc
% t0=0;T=5;
% h=0.1;
t=(t0:h:T);
n=length(t);
ExactU=c1D(t,ft);

% 1)向前Euler法，单步显式法，u(i)=u(i-1)+h*f(t(i-1),u(i-1))
u=0.*t;
u(1)=ExactU(1);
tic;
for i=2:n
    u(i)=u(i-1)+h*f1D(t(i-1),u(i-1),ft);
end
time1=toc;
NumU1=u;
Err1=(NumU1(n)-ExactU(n));
RelErr1=Err1/ExactU(n);




% 4)改进Euler法，单步显式法，uc(i)=u(i-1)+h*f(t(i-1),u(i-1)),u(i)=u(i-1)+(h/2)*(f(t(i-1),u(i-1)+f(t(i),uc(i)))
u=0.*t;
u(1)=ExactU(1);
tic;
for i=2:n
    uc1=u(i-1)+h*f1D(t(i-1),u(i-1),ft);
    u(i)=u(i-1)+(h/2)*(f1D(t(i-1),u(i-1),ft)+f1D(t(i),uc1,ft));
end
time4=toc;
NumU4=u;
Err4=(NumU4(n)-ExactU(n));
RelErr4=Err4/ExactU(n);


%画图
figure;
plot(t,ExactU,'k-*',t,NumU1,'g-o',t,NumU4,'c-o');
legend('精确解','Euler','改进Euler','location','northeastoutside');

%制表
f=figure;
data=([t;ExactU;NumU1;NumU4])';
data=[data;[0,0,Err1,Err4];[0,0,RelErr1,RelErr4];[0,0,time1,time4]];
colnames={'t','精确解','Euler','改进Euler'};
tab=uitable(f,'Data',data,'ColumnName',colnames,'Position',[50 50 800 500]);