%p104ÊýÖµÀý×Ó
function [v,vx,vy,f,aa,bb,cc,dd] = u2D(x,y)
        v=cos(3*x).*sin(pi*y)/(9+pi^2);
        vx=-3*sin(3*x).*sin(pi*y)/(9+pi^2);
        vy=pi*cos(3*x).*cos(pi*y)/(9+pi^2);
        f=cos(3*x).*sin(pi*y);
        aa=0;bb=pi;cc=0;dd=1;
end
