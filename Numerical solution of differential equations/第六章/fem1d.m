function fem1d(ftype,bt,nn,DsId)

global ft x NodeNum xds;

ft=ftype;
NodeNum=nn;

[~,~,~,~,~,aa,bb]=f1D(0,ft);
xl=aa;xr=bb;
h=(xr-xl)/(NodeNum-1);
x=(xl:h:xr);
xds=x(DsId);
[ExactU,~,~,~,~,~,~]=f1D(x,ft);

EleNum=NodeNum-1;
Ele=[];
kg=zeros(NodeNum,NodeNum);
bg=zeros(NodeNum,1);
for i=1:EleNum
    Ele(i,:)=[i,i+1];
    EleId=Ele(i,:);
    [ke,be]=D1N2EleMatrix(EleId);
    kg=kg+ke;
    bg=bg+be;
end

switch bt
    case 1
        lbId=1; rbId=NodeNum;
        kg(lbId,:)=0;kg(lbId,lbId)=1;bg(lbId)=ExactU(lbId);
        kg(rbId,:)=0;kg(rbId,rbId)=1;bg(rbId)=ExactU(rbId);
    case 2
        lbId=1;rbId=NodeNum;
        kg(lbId,:)=0;kg(lbId,lbId)=1;bg(lbId)=ExactU(lbId);
        [~,ExactUx,p,~,~,~,~]=f1D(x(rbId),ft);
        bg(rbId)=bg(rbId)+p*ExactUx;
end

NumU1=kg\bg;
MaxErr1=max(abs(ExactU'-NumU1));
fprintf('��������:%i',ft);
fprintf(',��ֵ����:%i',bt);
fprintf(',���Ե�Ԫ:�ڵ�����=%i',NodeNum);
fprintf(',���������%f\n',MaxErr1);

if mod(NodeNum-1,2)
    fprintf('���ε�ԪҪ��ڵ�����Ϊ����');
    return
end
EleNum=(NodeNum-1)/2;
Ele=[];
kg=zeros(NodeNum,NodeNum);
bg=zeros(NodeNum,1);
for i=1:EleNum
    Ele(i,:)=[2*i-1,2*i,2*i+1];
    EleId=Ele(i,:);
    [ke,be]=D1N3EleMatrix(EleId);
    kg=kg+ke;
    bg=bg+be;
end

switch bt
    case 1
        lbId=1; rbId=NodeNum;
        kg(lbId,:)=0;kg(lbId,lbId)=1;bg(lbId)=ExactU(lbId);
        kg(rbId,:)=0;kg(rbId,rbId)=1;bg(rbId)=ExactU(rbId);
    case 2
        lbId=1;rbId=NodeNum;
        kg(lbId,:)=0;kg(lbId,lbId)=1;bg(lbId)=ExactU(lbId);
        [~,ExactUx,p,~,~,~,~]=f1D(x(rbId),ft);
        bg(rbId)=bg(rbId)+p*ExactUx;
end

NumU2=kg\bg;
MaxErr2=max(abs(ExactU'-NumU2));
fprintf('��������:%i',ft);
fprintf(',��ֵ����:%i',bt);
fprintf(',���ε�Ԫ:�ڵ�����=%i',NodeNum);
fprintf(',���������%f\n',MaxErr2);

figure;
plot(x,ExactU,'r--',x,NumU1,x,NumU2,'go')
title('FEM1D���뾫ȷ�Ա�ͼ');
legend('��ȷ��','���Ե�Ԫ','���ε�Ԫ','Location','NorthEastOutside');