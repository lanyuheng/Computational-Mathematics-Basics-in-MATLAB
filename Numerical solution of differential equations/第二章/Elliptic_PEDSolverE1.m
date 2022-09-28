function Elliptic_PEDSolverE1(M,N) 
[~,~,~,~,x1,xr,y1,yr]=uE1(0,0);
h1=(xr-x1)/M;
h2=(yr-y1)/N;
xd=(x1:h1:xr);  %����ڵ�����
yd=(y1:h2:yr);  %����ڵ�����
 
%����ȫ���ڵ��ż�AId(����ڵ���������±��Ų�һ��)
AId=zeros(M+1,N+1);
xk=zeros((M+1)*(N+1),1);  %�����������Ľڵ�����
yk=zeros((M+1)*(N+1),1);  %�����������Ľڵ�����
for i=0:M
    for j=0:N
        AId(i+1,j+1)=i*(N+1)+j+1;  %ע������Ŵ�1��ʼ
        xk(i*(N+1)+j+1)=xd(i+1);  
        yk(i*(N+1)+j+1)=yd(j+1);  
    end
end
AId=AId';AId=AId(:);
 
%�����ڲ��ڵ��ż�    InId
InId=zeros(M-1,N-1);
for i=1:M-1
    for j=1:N-1
        InId(i,j)=i*(N+1)+j+1;
    end
end
InId=InId';InId=InId(:);
 
%������߽�ڵ��ż�   LbId
for j=0:N
    LbId(j+1)=0*(N+1)+j+1;
end
 
%�����ұ߽�ڵ��ż�   RbId
for j=0:N
    RbId(j+1)=M*(N+1)+j+1;
end
 
%�����±߽�ڵ��ż�  ��BbId
for i=0:M
    BbId(i+1)=i*(N+1)+0+1;
end
 
%�����ϱ߽�ڵ��ż�  ��TbId
for i=0:M
    TbId(i+1)=i*(N+1)+N+1;
end
 
% %��ʾ����ڵ���ͼ
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
 
 
 
%��ʼ�������Ҷ���
A=zeros((M+1)*(N+1),(M+1)*(N+1));
b=zeros((M+1)*(N+1),1);
hh1=h1^2;
hh2=h2^2;
 
%�ڲ��ڵ��γɾ�����Ԫ�ؼ��Ҷ���
for i=1:length(InId)
    k=InId(i);  %��ȡ�ڲ��ڵ���
    A(k,k)=2*(hh1+hh2);
    A(k,k-1)=-hh1;
    A(k,k+1)=-hh1;
    A(k,k-N-1)=-hh2;
    A(k,k+N+1)=-hh2;
    [~,~,~,ff]=uE1(xk(k),yk(k));   %��ȡ�Ҷ����ֵ
    b(k)=hh1*hh2*ff;
 
end
 
%��ӱ߽�����Ԫ�ؼ��Ҷ���
%������߽�ڵ������Ԫ�ؼ��Ҷ���
for j=1:length(LbId)
    k=LbId(j);
    A(k,k)=1;
    A(k,k+N+1)=0;
    [uv,~,~,~]=uE1(xk(k),yk(k));  %��ȡ�Ҷ����ֵ;��һ��ֵ����
    b(k)=uv;
    %b(k)=0;
end
 
%�����ұ߽�ڵ������Ԫ�ؼ��Ҷ���
for j=1:length(RbId)
    k=RbId(j);
    A(k,k)=1;
    A(k,k-N-1)=0;
    [uv,~,~,~]=uE1(xk(k),yk(k));  %��ȡ�Ҷ����ֵ���ڵ�һ��ֵ����
    b(k)=uv;
    %b(k)=0;
end
 
%�����±߽�ڵ������Ԫ�ؼ��Ҷ���
for i=1:length(BbId)
    k=BbId(i);
    A(k,:)=0;  %�����������߽��������ظ�����ո���Ԫ��
    A(k,k)=1;
    [uv,~,~,~]=uE1(xk(k),yk(k));  %��ȡ�Ҷ����ֵ����һ��ֵ����
    b(k)=uv;
    %b(k)=0;
end
 
%�����ϱ߽�ڵ������Ԫ�ؼ��Ҷ���
for i=1:length(TbId)
    k=TbId(i);
    A(k,:)=0;  %�����������߽��������ظ�����ո���Ԫ��
    A(k,k)=1;
    [uv,~,~,~]=uE1(xk(k),yk(k));  %��ȡ�Ҷ����ֵ����һ��ֵ����
    b(k)=uv;
    %b(k)=0;
end
 
uk= A\b;  %�����������ڵ��������ֵ��
ExactUk=uE1(xk,yk);   %��������ڵ�����ľ�ȷ��
MaxErr=max(abs(uk-ExactUk));
fprintf('MaxErr=%3.6f\n',MaxErr);
 
 
%����ֵ��ת��Ϊ��������
NuU=zeros(M+1,N+1);
for i=0:M
    for j=0:N
        k=i*(N+1)+j+1;
        NuU(i+1,j+1)=uk(k);
    end
end
NuU=NuU';
 
%��ȷ�⻭ͼ
[X,Y]=meshgrid(xd,yd);
U=uE1(X,Y);
figure;
mesh(X,Y,U);
xlabel('X-axis');ylabel('Y-axis');zlabel('Z-axis');
hold on;
%��ֵ�⻭ͼ
plot3(xk,yk,uk,'+')
hold on;
