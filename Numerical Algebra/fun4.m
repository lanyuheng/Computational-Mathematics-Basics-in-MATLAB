function [b,a]=fun4
a1=diag(ones(1,83),1);
a2=diag(6*ones(1,84));
a3=diag(8*ones(1,83),-1);
a=a1+a2+a3;
b=15*ones(84,1);
b(1)=b(1)-8;
b(84)=b(84)-1;
end