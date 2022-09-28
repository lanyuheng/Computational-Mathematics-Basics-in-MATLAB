function f=fun5
syms x1 x2
f=(1-x1).^2+100*(x2-x1.^2).^2;
for i=2:1:1
    f=f+(1-sym(['x',num2str(i)])).^2+100*(sym(['x',num2str(i+1)])-sym(['x',num2str(i)]).^2).^2;
end