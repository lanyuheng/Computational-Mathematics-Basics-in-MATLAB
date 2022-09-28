function a=gradient1(f,x,n)

X=sym('x',[1,n]);
grad2=hessian(f);
a=double((subs(grad2,X,x')));

end