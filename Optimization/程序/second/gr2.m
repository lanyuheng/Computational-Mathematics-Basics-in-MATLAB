function h=gr2(x,n)
h=zeros(n);
h(1,1)=2+400*(x(1).^2-x(2))+800*x(1).^2;
h(2,1)=-400*x(1);
for i=2:n
    if i==n
        h(i-1,i)=-400*x(i-1);
        h(i,i)=200;
    else
        h(i-1,i)=-400*x(i-1);
        h(i,i)=200+2+800*x(i)+400*(x(i).^2-x(i+1));
        h(i+1,i)=-400*x(i);
    end
end