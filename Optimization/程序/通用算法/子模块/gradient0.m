function a=gradient0(f,x,n)
    X=sym('x',[1,n]);
    grad1=gradient(f);
    a=double(subs(grad1,X,x'));
end