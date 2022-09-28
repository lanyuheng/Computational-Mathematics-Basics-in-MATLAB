function f=fun
n=3;
a=unidrnd(10,n,1);
g=a*(a')+unidrnd(5)*eye(n);
b=g*ones(n,1);
X=sym('x',[1,n]);
f=(X*g*X')./2+b'*X';
end