 function [Ae,be]=D1N2EleMatrix(EleId)
global ft x NodeNum;

Id1=EleId(1);  Id2=EleId(2);
Ja=x(Id2)-x(Id1);
t=[0,1];
w=[1/2,1/2];
N1=1-t;
N2=t;
N1t=-1+0*t;
N2t=1+0*t;
Ae=zeros(NodeNum,NodeNum);
be=zeros(NodeNum,1);
for k=1:2
    xt=x(Id1)+(x(Id2)-x(Id1))*t;
    [~,~,p,q,f,~,~]=f1D(xt,ft);
    Ae(Id1,Id1)=Ae(Id1,Id1)+w(k)*(p(k)*N1t(k)*N1t(k)/Ja+q(k)*N1(k)*N1(k)*Ja);
    Ae(Id1,Id2)=Ae(Id1,Id2)+w(k)*(p(k)*N1t(k)*N2t(k)/Ja+q(k)*N1(k)*N2(k)*Ja);
    Ae(Id2,Id1)=Ae(Id2,Id1)+w(k)*(p(k)*N2t(k)*N1t(k)/Ja+q(k)*N2(k)*N1(k)*Ja);
    Ae(Id2,Id2)=Ae(Id2,Id2)+w(k)*(p(k)*N2t(k)*N2t(k)/Ja+q(k)*N2(k)*N2(k)*Ja);
    be(Id1)=be(Id1)+w(k)*f(k)*N1(k)*Ja;
    be(Id2)=be(Id2)+w(k)*f(k)*N2(k)*Ja;
end