clc;clear;
f=fun2;
n=2;%����δ֪Ԫ����
%x0=[0,0]';
%x0=[3,-1,0,1]';
%x0=[0,1]';
x0=zeros(n,1);%��ʼ��
%����p-ѡ�񲽳�    grad1=gradient(f);
% 1-��ȷ����������֧�ֶ��κ�����
% 2-Armijo������
% 3-wolf������
% 4-ǿwolf������
p=2;
%����q-ѡ����
% 1-�����½���
% 2-ţ�ٷ�
% 3-DFP��
% 4-BFGS��
% 5-�����ݶȷ�
q=2;
[s,x,d,a,val,k]=allf(f,n,x0,p,q);
% creatfigure(f,x,s(2:k+1),k);
%��һ��������Զ�Ԫ���������ıƽ�ͼ
K=0:1:k-2;
% s=log10(s);
% x=log10(x);
% d=log10(d);
% a=log10(a);
hold on;
subplot(2,2,1);
plot(K,s(2:k));
legend('�ݶȷ���')
subplot(2,2,2);
plot(K,x(:,1:k-1)');
legend('xȡֵ')
subplot(2,2,3);
plot(K,d(:,2:k)');
legend('�½�����')
subplot(2,2,4);
plot(K(1:k-2),a(2:k-1));
%�����ݶ�����������ı仯,�����ݶ�ȡ�˶���
legend('����')