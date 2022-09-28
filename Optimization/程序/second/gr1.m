function g=gr1(x,n)
g=2*(x(1)-1)+400*x(1)*(x(1).^2-x(2));
for i=2:n-1
    g=[g,2*(x(i)-1)+400*x(i)*(x(i).^2-x(i+1))+200*(x(i)-x(i-1).^2)];
end
g=[g,200*(x(n)-x(n-1).^2)];
g=g';
end