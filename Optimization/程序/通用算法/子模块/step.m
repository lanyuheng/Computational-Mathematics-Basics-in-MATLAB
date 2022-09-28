function  a=step(grad1,f,x,d,p,n,X)
switch p
    case 1
        a=-(grad1'*d)/(d'*gradient1(f,x,n)*d);
    case 2
        c0=0.1;r=0.5;z=1;a=1;
        while(z>1e-10)
            a=a*r;
            z=double(subs(f,X,(x+a*d)'))-double(subs(f,X,x'))-c0*a*grad1'*d;
        end
    case 3
        r=0.25;t=0.75;a=1;a1=0;b1=1;g=gradient(f);
        while a1<b1
            grad1=double(subs(g,X,x'));
            z=double(subs(f,X,(x+a*d)'))-double(subs(f,X,x'))-r*a*grad1'*d;
            v=double(subs(g,X,(x+a*d)'))'*d-t*double(subs(g,X,x'))'*d;
        if z<0
            if v>0
                break;
            else
                a1=a;
                a=(a1+b1)/2;
            end
        else
            b1=a;
            a=(a+a1)/2;
        end
        end
    case 4
        r=0.25;t=0.75;z=1;a=1;a1=0;b1=1;g=gradient(f);
        while a1<b1
            grad1=double(subs(g,X,x'));
            z=double(subs(f,X,(x+a*d)'))-double(subs(f,X,x'))-r*a*grad1'*d;
            v1=double(subs(g,X,(x+a*d)'))'*d;
            v2=t*double(subs(g,X,x'))'*d;
        if z<0
            if abs(v1)+v2<0
                break;
            elseif v1<0
                a1=a;
                a=(a1+b1)/2;
            elseif v1>0
                b1=a;
                a=(a+a1)/2;
            end
        else
            b1=a;
            a=(a+a1)/2;
        end
        end
end
end