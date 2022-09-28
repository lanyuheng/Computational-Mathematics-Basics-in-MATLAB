function [Ae,be]=D2N4EleMatrix(EleId)
global ft xk yk NodeNum;

Id1=EleId(1);  Id2=EleId(2);Id3=EleId(3);Id4=EleId(4);
Jx=xk(Id2)-xk(Id1);
Jy=yk(Id3)-yk(Id2);
s=[0 1 1 0];
t=[0 0 1 1];
w=[1/4,1/4,1/4,1/4];
N1=(2*t-1).*(t-1);
N2=4*t.*(1-t);
N3=(2*t-1).*t;
N=[(1-s).*(1-t);s.*(1-t);s.*t;(1-s).*t];
Ns=[-(1-t);(1-t);t;-t];
Nt=[-(1-s);-s;s;(1-s)];

Ae=zeros(NodeNum,NodeNum);
be=zeros(NodeNum,1);
for k=1:2
    xt=xk(Id1)+(xk(Id2)-xk(Id1))*s;
    yt=yk(Id2)+(yk(Id3)-yk(Id2))*t;
    [~,~,~,f]=u2D(xt,yt,ft);
    Ae(EleId,EleId)=Ae(EleId,EleId)+w(k)*(Ns(:,k)*Ns(:,k)'*Jy/Jx+Nt(:,k)*Nt(:,k)'*Jx/Jy);
    be(EleId)=be(EleId)+w(k)*f(k)*N(:,k)*Jx*Jy;
end