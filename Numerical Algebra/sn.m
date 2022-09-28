function s=sn(r,x,y)
s=0;q=x(1)-r;
n=length(x);
for k=1:n
    if q<0
        s=s+1;
    end
    if k<n
        if q==0
            q=abs(y(k+1))*10^(-7);
        end
        q=x(k+1)-r-(y(k+1)^2)/q;
    end
end