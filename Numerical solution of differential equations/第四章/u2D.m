function [v,vt,aa,bb,cc,dd]=u2D(x,t,ft)

switch ft
    case 1
        v=cos(4*pi*t)*sin(4*pi*x)+sin(8*pi*t)*sin(8*pi*x)/(8*pi);
        vt=-4*pi*sin(4*pi*t)*sin(4*pi*x)+cos(8*pi*t)*sin(8*pi*x);
        aa=0;bb=1;cc=0;dd=1;
    case 2
        v=sin(pi*(x-t))+sin(pi*(x+t));
        vt=-pi*cos(pi*(x-t))+pi*cos(pi*(x+t));
        aa=0;bb=1;cc=0;dd=1;
end