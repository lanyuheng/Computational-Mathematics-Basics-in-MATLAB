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

% 2)向后Euler法，单步隐式法，u(i）=u(i-1)+h*f(t(i),u(i))
u=0.*t;
u(1)=ExactU(1);
tic;
for i=2:n
    uc1=u(i-1)-1;
    uc2=u(i-1);
    delta=10^(-5);
    while abs(uc2-uc1)>delta
        uc1=uc2;
        uc2=u(i-1)+h*f1D(t(i),uc1,ft);
    end
    u(i)=uc2;
end
time2=toc;
NumU2=u;
Err2=(NumU2(n)-ExactU(n));
RelErr2=Err2/ExactU(n);

% 3)梯形法，单步隐式法，u(i)=u(i-1)+(h/2)*(f(t(i-1),u(i-1))+f(t(i),u(i)))
u=0.*t;
u(1)=ExactU(1);
tic;
for i=2:n
    uc1=u(i-1)-1;
    uc2=u(i-1);
    delta=10^(-5);
    while abs(uc2-uc1)>delta
        uc1=uc2;
        uc2=u(i-1)+(h/2)*(f1D(t(i-1),u(i-1),ft)+f1D(t(i),uc1,ft));
    end
    u(i)=uc2;
end
time3=toc;
NumU3=u;
Err3=(NumU3(n)-ExactU(n));
RelErr3=Err3/ExactU(n);

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

% 7)simpson法，二步隐式法，u(i)=u(i-2)+(2*h/6)*(f(t(i-2),u(i-2))+4*f(t(i-1),u(i-1))+f(t(i),u(i)))
u=0.*t;
u(1)=ExactU(1);
u(2)=ExactU(2);
tic;
for i=3:n
    uc1=u(i-2);
    uc2=u(i-1);
    delta=10^(-5);
    while abs(uc2-uc1)>delta
        uc1=uc2;
        uc2=u(i-2)+(h/3)*(f1D(t(i-2),u(i-2),ft)+4*f1D(t(i-1),u(i-1),ft)+f1D(t(i),uc1,ft));
    end
    u(i)=uc2;
end
time7=toc;
NumU7=u;
Err7=(NumU7(n)-ExactU(n));
RelErr7=Err7/ExactU(n);

% 8)四级四阶RK法，单步显式法
u=0.*t;
u(1)=ExactU(1);
tic;
for i=2:n
    k1=f1D(t(i-1),u(i-1),ft);
    k2=f1D(t(i-1)+h/2,u(i-1)+(h/2)*k1,ft);
    k3=f1D(t(i-1)+h/2,u(i-1)+(h/2)*k2,ft);
    k4=f1D(t(i-1)+h,u(i-1)+h*k3,ft);
    u(i)=u(i-1)+(h/6)*(k1+2*k2+2*k3+k4);
end
time8=toc;
NumU8=u;
Err8=(NumU8(n)-ExactU(n));
RelErr8=Err8/ExactU(n);

%画图
figure;
plot(t,ExactU,'k-*',t,NumU1,'r-o',t,NumU2,'b-o',t,NumU3,'g-o',t,NumU4,'c-o',t,NumU5,'r-d',t,NumU7,'g-d',t,NumU8,'b-d');
legend('精确解','向前Euler','向后Euler','梯形法','改进Euler','二步法a=0','simpson法','RK法','location','northeastoutside');

%制表
f=figure;
data=([t;ExactU;NumU1;NumU2;NumU3;NumU4;NumU5;NumU6;NumU7;NumU8])';
data=[data;[0,0,Err1,Err2,Err3,Err4,Err5,Err6,Err7,Err8];[0,0,RelErr1,RelErr2,RelErr3,RelErr4,RelErr5,RelErr6,RelErr7,RelErr8];[0,0,time1,time2,time3,time4,time5,time6,time7,time8]];
colnames={'t','精确解','向前Euler','向后Euler','梯形法','改进Euler','二步法a=0','simpson法','RK法'};
tab=uitable(f,'Data',data,'ColumnName',colnames,'Position',[50 50 800 500]);