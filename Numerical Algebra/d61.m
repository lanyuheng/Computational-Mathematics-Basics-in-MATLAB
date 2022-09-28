clc;clear;
a1=[1,1,-5,3];a1=fliplr(a1);
a2=[1,0,-3,-1];a2=fliplr(a2);
a3=[1,101,208.01,10891.01,9802.08,79108.9,-99902,790,-1000];a3=fliplr(a3);
[m1,x1,k1]=powerm(3,a1);
[m2,x2,k2]=powerm(3,a2);
[m3,x3,k3]=powerm(8,a3);