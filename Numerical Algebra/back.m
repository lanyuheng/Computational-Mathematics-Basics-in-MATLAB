function y=back(u,y)

n=size(u);
n=n(1);
for j=n:-1:2
    y(j)=y(j)/u(j,j);
    y(1:j-1)=y(1:j-1)-y(j)*u(1:j-1,j);
end
y(1)=y(1)/u(1,1);
end