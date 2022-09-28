function Elliptic_PEDSolverE1(M,N) 
[~,~,~,~,x1,xr,y1,yr]=uE1(0,0);
h1=(xr-x1)/M;
h2=(yr-y1)/N;
xd=(x1:h1:xr);  %网格节点坐标
yd=(y1:h2:yr);  %网格节点坐标
 
%定义全部节点编号集AId(网格节点编号与矩阵下标编号不一致)
AId=zeros(M+1,N+1);
xk=zeros((M+1)*(N+1),1);  %整体编号排序后的节点坐标
yk=zeros((M+1)*(N+1),1);  %整体编号排序后的节点坐标
for i=0:M
    for j=0:N
        AId(i+1,j+1)=i*(N+1)+j+1;  %注意矩阵编号从1开始
        xk(i*(N+1)+j+1)=xd(i+1);  
        yk(i*(N+1)+j+1)=yd(j+1);  
    end
end
AId=AId';AId=AId(:);
 
%定义内部节点编号集    InId
InId=zeros(M-1,N-1);
for i=1:M-1
    for j=1:N-1
        InId(i,j)=i*(N+1)+j+1;
    end
end
InId=InId';InId=InId(:);
 
%定义左边界节点编号集   LbId
for j=0:N
    LbId(j+1)=0*(N+1)+j+1;
end
 
%定义右边界节点编号集   RbId
for j=0:N
    RbId(j+1)=M*(N+1)+j+1;
end
 
%定义下边界节点编号集  　BbId
for i=0:M
    BbId(i+1)=i*(N+1)+0+1;
end
 
%定义上边界节点编号集  　TbId
for i=0:M
    TbId(i+1)=i*(N+1)+N+1;
end
 
% %显示整体节点编号图
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
 end
 
 
 
%初始化矩阵右端项
A=zeros((M+1)*(N+1),(M+1)*(N+1));
b=zeros((M+1)*(N+1),1);
hh1=h1^2;
hh2=h2^2;
 
%内部节点形成矩阵行元素及右端项
for i=1:length(InId)
    k=InId(i);  %提取内部节点编号
    A(k,k)=2*(hh1+hh2);
    A(k,k-1)=-hh1;
    A(k,k+1)=-hh1;
    A(k,k-N-1)=-hh2;
    A(k,k+N+1)=-hh2;
    [~,~,~,ff]=uE1(xk(k),yk(k));   %提取右端项函数值
    b(k)=hh1*hh2*ff;
 
end
 
%添加边界条件元素及右端项
%定义左边界节点矩阵行元素及右端项
for j=1:length(LbId)
    k=LbId(j);
    A(k,k)=1;
    A(k,k+N+1)=0;
    [uv,~,~,~]=uE1(xk(k),yk(k));  %提取右端项函数值;第一边值条件
    b(k)=uv;
    %b(k)=0;
end
 
%定义右边界节点矩阵行元素及右端项
for j=1:length(RbId)
    k=RbId(j);
    A(k,k)=1;
    A(k,k-N-1)=0;
    [uv,~,~,~]=uE1(xk(k),yk(k));  %提取右端项函数值，第第一边值条件
    b(k)=uv;
    %b(k)=0;
end
 
%定义下边界节点矩阵行元素及右端项
for i=1:length(BbId)
    k=BbId(i);
    A(k,:)=0;  %由于与其他边界条件有重复，清空该行元素
    A(k,k)=1;
    [uv,~,~,~]=uE1(xk(k),yk(k));  %提取右端项函数值，第一边值条件
    b(k)=uv;
    %b(k)=0;
end
 
%定义上边界节点矩阵行元素及右端项
for i=1:length(TbId)
    k=TbId(i);
    A(k,:)=0;  %由于与其他边界条件有重复，清空该行元素
    A(k,k)=1;
    [uv,~,~,~]=uE1(xk(k),yk(k));  %提取右端项函数值，第一边值条件
    b(k)=uv;
    %b(k)=0;
end
 
uk= A\b;  %求解所得整体节点排序的数值解
ExactUk=uE1(xk,yk);   %所得整体节点排序的精确解
MaxErr=max(abs(uk-ExactUk));
fprintf('MaxErr=%3.6f\n',MaxErr);
 
 
%将数值解转化为网格排序
NuU=zeros(M+1,N+1);
for i=0:M
    for j=0:N
        k=i*(N+1)+j+1;
        NuU(i+1,j+1)=uk(k);
    end
end
NuU=NuU';
 
%精确解画图
[X,Y]=meshgrid(xd,yd);
U=uE1(X,Y);
figure;
mesh(X,Y,U);
xlabel('X-axis');ylabel('Y-axis');zlabel('Z-axis');
hold on;
%数值解画图
plot3(xk,yk,uk,'+')
hold on;
