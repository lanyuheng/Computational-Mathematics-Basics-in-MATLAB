clear all
clc

J1=40;
N1=3520;
[U1,error1,ExactU1]=Forward_Euler(1,J1,N1);
J2=80;
N2=11520;
[U2,error2]=Forward_Euler(1,J2,N2);

f=figure;
colnames={'格式','h','r','x1','x2','x3','x4','误差阶'};
data = {'向前' '1/40' '5/11' U1(J1/4+1,end) U1(2*J1/4+1,end) U1(3*J1/4+1,end) U1(J1+1,end) error1;
        '    ' '1/80' '5/9' U2(J1/4+1,end) U2(2*J1/4+1,end) U2(3*J1/4+1,end) U2(J1+1,end) error2;
        '精确解' ' ' ' ' ExactU1(J1/4+1,end) ExactU1(2*J1/4+1,end) ExactU1(3*J1/4+1,end) ExactU1(J1+1,end) ' ' ;};
    t=uitable(f,'Data',data,'columnName',colnames,'Position',[10 10 700 400]);