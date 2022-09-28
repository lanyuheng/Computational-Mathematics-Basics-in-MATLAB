function [U,MaxErr,ExactU] = Forward_Euler(ft,J,N)

[~,~,x1,xr,t0,tn]=u2D(0,0,ft);

h=(xr-x1)/J;
tau=(tn-t0)/N;
x=(x1:h:xr);
t=(t0:tau:tn);
r=tau/(h^2);
diag_0=(1-2*r)*ones(J+1,1);
diag_1=r*ones(J,1);

C=diag(diag_0)+diag(diag_1,-1)+diag(diag_1,1);
C(1,2)=2*r;
C(J+1,J)=2*r;

ExactU=zeros(J+1,N+1);
U=zeros(J+1,N+1);
ExactU(:,1)=u2D(x,t(1),ft);
U(:,1)=ExactU(:,1);

for n=2:N+1
    [~,f]=u2D(x,t(n-1),ft);
    U(:,n)=C*U(:,n-1)+tau*f';
    ExactU(:,n)=u2D(x,t(n),ft);
end
MaxErr=max(abs(ExactU(:,N+1)-U(:,N+1)));
fprintf('E-F格式：网格比r=%f',r);
fprintf(',最大的误差是%8.10f\n',MaxErr);
figure;
plot(x,U(:,N+1),'b*',x,ExactU(:,N+1),'r--')
title('向前Euler差分解与精确解对比图');
legend('向前Euler差分解','精确解');
    