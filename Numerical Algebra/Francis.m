function [H22]=Francis(A)%QRµü´ú
H22=A;
q=size(H22);
q=q(2);
p=q-1;
s=H22(p,p)+H22(q,q);
t= H22(p,p)* H22(q,q)- H22(p,q)*H22(q,p);
x=H22(1,1)*H22(1,1)+H22(1,2)*H22(2,1)-s* H22(1,1)+t;
y=H22(2,1)*(H22(1,1)+H22(2,2)-s);
z=H22(2,1)*H22(3,2);
for k=0:q-3;
[v,b]=house([x,y,z]');
w=max(1,k);
H22(k+1:k+3,w:q)=(eye(3)-b*v*v')* H22(k+1:k+3,w:q); 
r=min(k+4,q);
H22(1:r,k+1:k+3)= H22(1:r,k+1:k+3)*(eye(3)-b*v*v');
x=H22(k+2,k+1);
y=H22(k+3,k+1);
if k<q-3
z=H22(k+4,k+1);
end
end
[v,b]=house([x,y]');
H22(q-1:q,q-2:q)=(eye(2)-b*v*v')*H22(q-1:q,q-2:q);
H22(1:q,q-1:q)=H22(1:q,q-1:q)*(eye(2)-b*v*v');