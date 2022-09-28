function [v,vx,vy,f,aa,bb,cc,dd]=u2D(x,y,ft)

switch ft
    case 1
        v=cos(3*x).*sin(pi*y)/(9+pi^2);
        vx=-3*sin(3*x).*sin(pi*y)/(9+pi^2);
        vy=pi*cos(3*x).*cos(pi*y)/(9+pi^2);
        f=cos(3*x).*sin(pi*y);
        aa=0;bb=pi;cc=0;dd=1;
    case 2
        v=cos(3*x).*sin(pi*y)/(9+pi^2);
        vx=-3*sin(3*x).*sin(pi*y)/(9+pi^2);
        vy=pi*cos(3*x).*cos(pi*y)/(9+pi^2);
        f=cos(3*x).*sin(pi*y);
        aa=0.3;bb=3.5;cc=0.2;dd=1.8;
end