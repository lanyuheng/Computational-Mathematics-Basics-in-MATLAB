function [Ae,be]=D1N3EleMatrix(EleId)
global ft x NodeNum;

Id1=EleId(1);Id2=EleId(2);Id3=EleId(3);
Ja=(x(Id3)-x(Id1));
t=[0,1/2,1];
w=[1,4,1]/6;
N1=(2*t-1).*(t-1);
N2=4*t.*(1-t);
N3=(2*t-1).*t;
N1t=4*t-3;
N2t=4-8*t;
N3t=4*t-1;
Ae=zeros(NodeNum,NodeNum);
be=zeros(NodeNum,1);
for k=1:3
    xt=x(Id1)+(x(Id3)-x(Id1))*t;
    [~,~,p,q,f,~,~]=f1D(xt,ft);
    Ae(Id1,Id1)=Ae(Id1,Id1)+w(k)*(p(k)*N1t(k)*N1t(k)/Ja+q(k)*N1(k)*N1(k)*Ja);
    Ae(Id1,Id2)=Ae(Id1,Id2)+w(k)*(p(k)*N1t(k)*N2t(k)/Ja+q(k)*N1(k)*N2(k)*Ja);
    Ae(Id1,Id3)=Ae(Id1,Id3)+w(k)*(p(k)*N1t(k)*N3t(k)/Ja+q(k)*N1(k)*N3(k)*Ja);
    Ae(Id2,Id1)=Ae(Id2,Id1)+w(k)*(p(k)*N2t(k)*N1t(k)/Ja+q(k)*N2(k)*N1(k)*Ja);
    Ae(Id2,Id2)=Ae(Id2,Id2)+w(k)*(p(k)*N2t(k)*N2t(k)/Ja+q(k)*N2(k)*N2(k)*Ja);
    Ae(Id2,Id3)=Ae(Id2,Id3)+w(k)*(p(k)*N2t(k)*N3t(k)/Ja+q(k)*N2(k)*N3(k)*Ja);
    Ae(Id3,Id1)=Ae(Id3,Id1)+w(k)*(p(k)*N3t(k)*N1t(k)/Ja+q(k)*N3(k)*N1(k)*Ja);
    Ae(Id3,Id2)=Ae(Id3,Id2)+w(k)*(p(k)*N3t(k)*N2t(k)/Ja+q(k)*N3(k)*N2(k)*Ja);
    Ae(Id3,Id3)=Ae(Id3,Id3)+w(k)*(p(k)*N3t(k)*N3t(k)/Ja+q(k)*N3(k)*N3(k)*Ja);
    be(Id1)=be(Id1)+w(k)*f(k)*N1(k)*Ja;
    be(Id2)=be(Id2)+w(k)*f(k)*N2(k)*Ja;
    be(Id3)=be(Id3)+w(k)*f(k)*N3(k)*Ja;
end