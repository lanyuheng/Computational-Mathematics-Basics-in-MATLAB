function Elliptic_PEDSolver(M,N)
[~,~,~,~,x1,xr,y1,yr]=u2D(0,0);
h1 = (xr - x1) / M;
h2 = (yr - y1) / N;
xd = (x1:h1:xr);
yd = (y1:h2:yr); 

AId = zeros(M+1,N+1);
xk = zeros((M+1)*(N+1),1);  
yk = zeros((M+1)*(N+1),1);  
for i = 0 : M
    for j = 0 : N
        AId(i+1,j+1) = i *(N+1) + j + 1; 
        xk(i*(N+1)+j+1) = xd(i+1);  
        yk(i*(N+1)+j+1) = yd(j+1);  
    end
end
AId = AId';
AId = AId(:);
 
InId = zeros(M-1,N-1);
for i = 1 : M-1
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
end
A=zeros((M+1)*(N+1),(M+1)*(N+1));
b=zeros((M+1)*(N+1),1);
hh1=h1^2;
hh2=h2^2;
 
for i=1:length(InId)
    k=InId(i); 
    A(k,k)=2*(hh1+hh2);
    A(k,k-1)=-hh1;
    A(k,k+1)=-hh1;
    A(k,k-N-1)=-hh2;
    A(k,k+N+1)=-hh2;
    [~,~,~,ff]=u2D(xk(k),yk(k)); 
    b(k)=hh1*hh2*ff;
end
 
for j=1:length(LbId)
    k=LbId(j);
    A(k,k)=-1;
    A(k,k+N+1)=1;
    [~,ux,~,~]=u2D(xk(k),yk(k)); 
    b(k)=h1*ux;
end
 
for j=1:length(RbId)
    k=RbId(j);
    A(k,k)=1;
    A(k,k-N-1)=-1;
    [~,ux,~,~]=u2D(xk(k),yk(k)); 
    b(k)=h1*ux;
end
 
for i=1:length(BbId)
    k=BbId(i);
    A(k,:)=0; 
    A(k,k)=1;
    [uv,~,~,~]=u2D(xk(k),yk(k)); 
    b(k)=uv;
end
 
for i=1:length(TbId)
    k=TbId(i);
    A(k,:)=0; 
    A(k,k)=1;
    [uv,~,~,~]=u2D(xk(k),yk(k)); 
    b(k)=uv;
end
 
uk=A\b;
ExactUk=u2D(xk,yk);
MaxErr=max(abs(uk-ExactUk));
fprintf('MaxErr=%3.6f\n',MaxErr);
NuU=zeros(M+1,N+1);
for i=0:M
    for j=0:N
        k=i*(N+1)+j+1;
        NuU(i+1,j+1)=uk(k);
    end
end
NuU=NuU';
 
[X,Y]=meshgrid(xd,yd);
U=uE1(X,Y);
figure;
mesh(X,Y,U);
xlabel('X-axis');ylabel('Y-axis');zlabel('Z-axis');
hold on;
plot3(xk,yk,uk,'+');
hold on;
