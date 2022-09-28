function [U,MaxErr,ExactU] = Crank_Nicolson2(ft,J,N)

[~,~,x1,xr,t0,tn]=u2D(0,0,ft);

h=(xr-x1)/J;
tau=(tn-t0)/N;
x=(x1:h:xr);
t=(t0:tau:tn);
r=tau/(h^2);
diag_0=(1+r)*ones(J+1,1);
diag_1=(-r/2)*ones(J,1);
A=diag(diag_0)+diag(diag_1,-1)+diag(diag_1,1);
A(1,1)=1;A(1,2)=0;
A(J+1,J)=0;A(J+1,J+1)=1;
invA=inv(A);

diag_0=(1-r)*ones(J+1,1);
diag_1=(r/2)*ones(J,1);
B=diag(diag_0)+diag(diag_1,-1)+diag(diag_1,1);
B(1,1)=1;B(1,2)=0;
B(J+1,J)=0;B(J+1,J+1)=1;

ExactU=zeros(J+1,N+1);
U=zeros(J+1,N+1);
ExactU(:,1)=u2D(x,t(1),ft);
U(:,1)=ExactU(:,1);

for n=2:N+1
    ExactU(:,n)=u2D(x,t(n),ft);
    [~,f1]=u2D(x,t(n-1),ft);
    [~,f2]=u2D(x,t(n),ft);
    f=(f1+f2)/2;
    U(:,n)=invA*(B*U(:,n-1)+tau*f');
    U(1,n)=ExactU(1,n);
    U(J+1,n)=ExactU(J+1,n);
end
MaxErr=max(abs(ExactU(:,N+1)-U(:,N+1)));
fprintf('C-N格式：网格比r=%f',r);
fprintf(',最大的误差是%8.10f\n',MaxErr);
figure;
plot(x,U(:,N+1),'b*',x,ExactU(:,N+1),'r--')
title('C-N差分解与精确解对比图');
legend('C-N差分解','精确解');
    