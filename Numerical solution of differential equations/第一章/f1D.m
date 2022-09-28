function f=f1D(t,u,ft)

switch ft
    case 1
        f=-5*u;
    case 2
        f=4*t.*u.^(1/2);
    case 3
        f=u./(2*t)+(t.^2)/(2*u);
end