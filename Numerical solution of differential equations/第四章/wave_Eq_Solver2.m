function wave_Eq_Solver2(ft,J,N,w,bc)

[~,~,x1,xr,t0,tn]=u2D(0,0,ft);

h=(xr-x1)/J;
tau=(tn-t0)/N;
x=(x1:h:xr);
t=(t0:tau:tn);
r=tau/h;

diag_0=(1+2*w*r^2)*ones(J+1,1);
diag_1=(-w*r^2)*ones(J,1);
A=diag(diag_0)+diag(diag_1,-1)+diag(diag_1,1);
A(1,1)=1;A(1,2)=0;
A(J+1,J)=0;A(J+1,J+1)=1;
invA=inv(A);

diag_0=(2-2*(1-2*w)*r^2)*ones(J+1,1);
diag_1=((1-2*w)*r^2)*ones(J,1);
B=diag(diag_0)+diag(diag_1,-1)+diag(diag_1,1);
B(1,1)=1;B(1,2)=0;
B(J+1,J)=0;B(J+1,J+1)=1;

diag_0=(-1-2*w*r^2)*ones(J+1,1);
diag_1=(w*r^2)*ones(J,1);
C=diag(diag_0)+diag(diag_1,-1)+diag(diag_1,1);
C(1,1)=1;C(1,2)=0;
C(J+1,J)=0;C(J+1,J+1)=1;

ExactU=zeros(J+1,N+1);
U=zeros(J+1,N+1);
ExactU(:,1)=u2D(x,t(1),ft);
ExactU(:,2)=u2D(x,t(2),ft);
[~,ExactUt(:,1)]=u2D(x,t(1),ft);
U(:,1)=ExactU(:,1);

switch bc
    case 0
        U(:,2)=ExactU(:,2);
    case 1
        U(:,2)=U(:,1)+tau*ExactUt(:,1);
    case 2
        U(1,2)=U(1,1)+tau*ExactUt(1,1);
        U(J+1,2)=U(J+1,1)+tau*ExactU(J+1,1);
        for j=2:J
            U(j,2)=(r^2/2)*(U(j-1,1)+U(j+1,1))+(1-r^2)*U(j,1)+tau*ExactUt(j,1);
        end
end

for n=3:N+1
    ExactU(:,n)=u2D(x,t(n),ft);
    b=B*U(:,n-1)+C*U(:,n-2);
    b(1)=ExactU(1,n);
    b(J+1)=ExactU(J+1,n);
    U(:,n)=invA*b;
end
MaxErr=max(abs(ExactU(:,N+1)-U(:,N+1)));
fprintf('波动方程加权差分格式：网格比r=%2.2f',r);
fprintf(',加权系数w=%2.2f',w);
fprintf(',初值条件类型:%i',bc);
fprintf(',最大的误差是%2.4e\n',MaxErr);
figure;
plot(x,U(:,N+1),'b*',x,ExactU(:,N+1),'r--')
title('波动方程显式差分解与精确解对比图');
legend('波动方程显式差分解','精确解');
    