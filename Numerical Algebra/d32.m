clc;clear;
t=[-1,-0.75,-0.5,0,0.25,0.5,0.75];
y=[1,0.8125,0.75,1,1.3125,1.75,2.3125];
A=ones(7,3);
A(:,1)=t'.^2;
A(:,2)=t';
x=qrfj(y',A);
