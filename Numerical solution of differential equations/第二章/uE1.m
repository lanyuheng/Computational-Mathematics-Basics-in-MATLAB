%p104œ∞Ã‚ 1
function [v,vx,vy,f,aa,bb,cc,dd] = uE1(x,y)
v=exp(pi*(x+y)).*sin(pi*x).*sin(pi*y);    
vx=pi*exp(pi*(x+y)).*(sin(pi*x).*sin(pi.*y)+cos(pi*x).*sin(pi*y));     
vy=pi*exp(pi*(x+y)).*(sin(pi*x).*sin(pi*y)+cos(pi*y).*sin(pi*x));       
f=2*(pi^2)*exp(pi*(x+y)).*(sin(pi*x).*cos(pi*y)+cos(pi*x).*sin(pi*y));
aa=0;bb=1;cc=0;dd=1;
end