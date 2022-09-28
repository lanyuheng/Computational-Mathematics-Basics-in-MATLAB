clc;clear;
f=fun2;
n=2;%方程未知元个数
%x0=[0,0]';
%x0=[3,-1,0,1]';
%x0=[0,1]';
x0=zeros(n,1);%初始点
%参数p-选择步长    grad1=gradient(f);
% 1-精确线搜索（仅支持二次函数）
% 2-Armijo线搜索
% 3-wolf线搜索
% 4-强wolf线搜索
p=2;
%参数q-选择方向
% 1-最速下降法
% 2-牛顿法
% 3-DFP法
% 4-BFGS法
% 5-共轭梯度法
q=2;
[s,x,d,a,val,k]=allf(f,n,x0,p,q);
% creatfigure(f,x,s(2:k+1),k);
%上一函数是针对二元函数所作的逼近图
K=0:1:k-2;
% s=log10(s);
% x=log10(x);
% d=log10(d);
% a=log10(a);
hold on;
subplot(2,2,1);
plot(K,s(2:k));
legend('梯度范数')
subplot(2,2,2);
plot(K,x(:,1:k-1)');
legend('x取值')
subplot(2,2,3);
plot(K,d(:,2:k)');
legend('下降方向')
subplot(2,2,4);
plot(K(1:k-2),a(2:k-1));
%画出梯度随迭代次数的变化,其中梯度取了对数
legend('步长')