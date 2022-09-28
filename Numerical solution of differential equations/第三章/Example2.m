clear all
clc

J1=40;
N1=3200;
[U1,error1,ExactU1]=Forward_Euler2(1,J1,N1);
J2=80;
N2=12800;
[U2,error2]=Forward_Euler2(1,J2,N2);

J3=40;
N3=1600;
[U3,error3]=Backward_Euler2(1,J3,N3);
J4=80;
N4=3200;
[U4,error4]=Backward_Euler2(1,J4,N4);

J5=40;
N5=1600;
[U5,error5]=Crank_Nicolson2(1,J5,N5);
J6=80;
N6=3200;
[U6,error6]=Crank_Nicolson2(1,J6,N6);

f=figure;
colnames={'格式','h','r','x1','x2','x3','x4','误差阶'};
data = {'向前' '1/40' '1/2' U1(J1/4+1,end) U1(2*J1/4+1,end) U1(3*J1/4+1,end) U1(J1+1,end) error1;
        '    ' '1/80' '1/2' U2(J1/4+1,end) U2(2*J1/4+1,end) U2(3*J1/4+1,end) U2(J1+1,end) error2;
        '向后' '1/40' '1' U3(J3/4+1,end) U3(2*J3/4+1,end) U3(3*J3/4+1,end) U3(J3+1,end) error3;
        '    ' '1/80' '2' U4(J4/4+1,end) U4(2*J4/4+1,end) U4(3*J4/4+1,end) U4(J4+1,end) error4;
        '对称' '1/40' '1' U5(J5/4+1,end) U1(2*J5/4+1,end) U1(3*J5/4+1,end) U1(J5+1,end) error5;
        '    ' '1/80' '2' U6(J6/4+1,end) U2(2*J6/4+1,end) U2(3*J6/4+1,end) U2(J6+1,end) error6;
        '精确解' ' ' ' ' ExactU1(J1/4+1,end) ExactU1(2*J1/4+1,end) ExactU1(3*J1/4+1,end) ExactU1(J1+1,end) ' ' ;};
    t=uitable(f,'Data',data,'columnName',colnames,'Position',[10 10 700 400]);