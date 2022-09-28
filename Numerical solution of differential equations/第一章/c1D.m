function v=u1D(t,ft)

switch ft
    case 1
        v=exp(-5*t);
    case 2
        v=(1+t.^2).^2;
    case 3
        v=sqrt(t+(1/2)*t.^3);
end