function [u,ux,p,q,f,aa,bb]=f1D(x,ft)

global xds

switch ft
    case 0
        u=sin(x);
        ux=cos(x);
        p=1+0*x;
        q=0*x;
        f=sin(x);
        aa=0;bb=2*pi;
    case 1
        u=sin(pi*x/2);
        ux=cos(pi*x/2)*pi/2;
        p=1+0*x;
        q=pi^2/4+0*x;
        f=(pi^2/2)*sin(pi*x/2);
        aa=0.5;bb=1.2;
    case 2
        u=x.*sin(x);
        ux=sin(x)+x.*cos(x);
        p=1+0*x;
        q=1+0*x;
        f=2*x.*sin(x)-2*cos(x);
        aa=0.0;bb=2*pi;
    case 3
        u=x.*sin(x);
        ux=sin(x)+x.*cos(x);
        p=x;
        q=-x;
        f=-sin(x)-3*x.*cos(x);
        aa=0.0;bb=2*pi;
end
        
        