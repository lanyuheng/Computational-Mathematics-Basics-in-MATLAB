function  d=direction(grad1,grad0,f,x,x1,q,n,d0,h,D,k);
switch q
    case 1
        d=-grad1;
    case 2
        d=-inv(gradient1(f,x,n))*grad1;
    case 3
        y=grad1-grad0;
        t=x-x1;
        h=h-(h*y*y'*h)/(y'*h*y)+(t*t')/(t'*y);
        d=-h*grad1;
    case 4
        y=grad1-grad0;
        t=x-x1;
        h=h-(h*y*y'*h)/(y'*h*y)+(t*t')/(t'*y);
        h=h';
        d=-h*grad1;
    case 5
        b=norm(grad1)^2/norm(grad0)^2;
        d=-grad1+b*d0;
end