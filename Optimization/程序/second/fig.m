K=1:1:k;
figure(1)
hold on;
subplot(2,2,1);
plot(K,log(S(1:k)));
legend('梯度范数')
subplot(2,2,2);
plot(K,log(X1(:,1:k)'));
legend('x取值')
subplot(2,2,3);
plot(K,log(D(:,1:k)'));
legend('下降方向')
subplot(2,2,4);
plot(K(1:k),log(A(1:k)));
%画出梯度随迭代次数的变化,其中梯度取了对数
legend('步长')
figure(2)
plot(K,log(Z(1:k-1)));