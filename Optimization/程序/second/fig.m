K=1:1:k;
figure(1)
hold on;
subplot(2,2,1);
plot(K,log(S(1:k)));
legend('�ݶȷ���')
subplot(2,2,2);
plot(K,log(X1(:,1:k)'));
legend('xȡֵ')
subplot(2,2,3);
plot(K,log(D(:,1:k)'));
legend('�½�����')
subplot(2,2,4);
plot(K(1:k),log(A(1:k)));
%�����ݶ�����������ı仯,�����ݶ�ȡ�˶���
legend('����')
figure(2)
plot(K,log(Z(1:k-1)));