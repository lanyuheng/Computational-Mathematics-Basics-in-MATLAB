function [b,a]=fun1
a1=diag(ones(1,99),-1);
a2=diag(ones(1,99),1);
a3=10*diag(ones(1,100));
a=a1+a2+a3;
b=rand(1,100)';
end