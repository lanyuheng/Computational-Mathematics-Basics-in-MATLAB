function fem2d(ftype,bt,M,N)

global ft xk yk NodeNum;

ft=ftype;
[~,~,~,~,xl,xr,yl,yr]=u2D(0,0,ft);
h1=(xr-xl)/M;
h2=(yr-yl)/N;
xd=(xl:h1:xr);
yd=(yl:h2:yr);
AId=zeros(M+1,N+1);
xk=zeros((M+1)*(N+1),1);
yk=zeros((M+1)*(N+1),1);
for i=0:M
    for j=0:N
        AId(i+1,j+1)=i*(N+1)+j+1;
        xk(i*(N+1)+j+1)=xd(i+1);
        yk(i*(N+1)+j+1)=yd(j+1);
    end
end
AId=AId';AId=AId(:);
InId=zeros(M-1,N-1);
for i=1:M-1
    for j=1:N-1
        InId(i,j)=i*(N+1)+j+1;
    end
end
InId=InId';InId=InId(:);

for j=0:N
    LbId(j+1)=0*(N+1)+j+1;
end

for j=0:N
    RbId(j+1)=M*(N+1)+j+1;
end

for i=0:M
    BbId(i+1)=i*(N+1)+0+1;
end

for i=0:M
    TbId(i+1)=i*(N+1)+N+1;
end

figure;
for i=0:M
    plot(xd(i+1)+0*yd,yd);
    hold on;
end
for j=0:N
    plot(xd,yd(j+1)+0*xd);
    hold on;
end
for i=1:length(AId)
    text(xk(i),yk(i),num2str(i));
    hold on;
end

NodeNum=length(AId);
EleNum=M*N;
Ele=[];
kg=zeros(NodeNum,NodeNum);
bg=zeros(NodeNum,1);
for i=1:EleNum
    Ele(i,:)=[i,i+N+1,i+N+2,i+1]+floor((i-1)/N);
    EleId=Ele(i,:);
    text(sum(xk(EleId))/4,sum(yk(EleId))/4,num2str(i),'BackgroundColor',[0.3,0.7,0.8]);
    hold on
    [ke,be]=D2N4EleMatrix(EleId);
    kg=kg+ke;
    bg=bg+be;
end

switch bt
    case 1
        Id=[LbId,RbId,TbId,BbId];
        kg(Id,:)=0;
        kg(Id,Id)=eye(length(Id));
        u=u2D(xk(Id),yk(Id),ft);
        bg(Id)=u;
        
    case 2
        [~,ux,~,~]=u2D(xk(LbId),yk(LbId),ft);
        bg(LbId)=bg(LbId)-ux*h2;
        [~,ux,~,~]=u2D(xk(RbId),yk(RbId),ft);
        bg(RbId)=bg(RbId)+ux*h2;
        
        Id=[TbId,BbId];
        kg(Id,:)=0;
        kg(Id,Id)=eye(length(Id));
        u=u2D(xk(Id),yk(Id),ft);
        bg(Id)=u;
end

uk=kg\bg;
ExUk=u2D(xk,yk,ft);
MaxErr2=max(abs(uk-ExUk));
fprintf('方程类型:%i',ft);
fprintf(',边值类型:%i',bt);
fprintf(',双线性单元:节点总数=%i',NodeNum);
fprintf(',最大的误差是%f\n',MaxErr2);

[X,Y]=meshgrid(xd,yd);
U=u2D(X,Y,ft);
figure;
mesh(X,Y,U);
xlabel('X-axis'),ylabel('Y-axis'),zlabel('Z-axis');
hold on
plot3(xk,yk,uk,'+');
hold on;