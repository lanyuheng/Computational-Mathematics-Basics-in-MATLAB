clc;clear;
[b,A]=fun4;
x1=qrfj(b,A);
x2=gauss(A,b);
x3=liegauss(A,b);
figure(1)
subplot(3,1,1);
plot(1:84,x1);title('QR分解');
hold on
subplot(3,1,2);
plot(1:84,x2);title('不选主元');
subplot(3,1,3);
plot(1:84,x3);title('列主元');
[b,A]=fun1;
x1=qrfj(b,A);
x2=gauss(A,b);
x3=liegauss(A,b);
figure(2)
subplot(3,1,1);
plot(1:100,x1);title('QR分解');
hold on
subplot(3,1,2);
plot(1:100,x2);title('不选主元');
subplot(3,1,3);
plot(1:100,x3);title('列主元');
[b,A]=fun2;
x1=qrfj(b,A);
x2=gauss(A,b);
x3=liegauss(A,b);
figure(3)
subplot(3,1,1);
plot(1:40,x1);title('QR分解');
hold on
subplot(3,1,2);
plot(1:40,x2);title('不选主元');
subplot(3,1,3);
plot(1:40,x3);title('列主元');
