function [v,f,aa,bb,cc,dd]=u2D(x,t,ft)

switch ft
    case 1
        v=exp(-(pi^2).*t).*cos(pi*x)+1-cos(t);
        f=sin(t)+0*x;
        aa=0;bb=1;cc=0;dd=1;
end