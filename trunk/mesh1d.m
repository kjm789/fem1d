function [x,h,theta,n2f] = mesh1d(n,r)
% Creates a one-dimensional mesh
% INPUT
% n - number of elements
% r - stretch factor
% sym - if 1, the mesh is symmetric around the middle 
% OUTPUT
% x - node coordinates
% h - mesh spacing
% theta - local-to-global mapping
% n2f - boundary condition capture
ng = n+1;
x=zeros(ng,1);
h=zeros(n,1);
if(abs(1.0-r)<1e-6)
  s=n;
else
  s=(1-r^n)/(1-r);
end
dx=1.0/s;

x(1)=0.0;
for i=2:ng
  h(i-1)=dx;
  x(i)=x(i-1)+dx;
  dx=r*dx;
end

theta = zeros(n,2);
for k = 1:n
  for alpha = 1:2
    theta(k,alpha) = k+alpha-1;
  end
end

n2f = zeros(ng,1);
n2f(1)=-1;
for i=2:n
  n2f(i)=i-1;
end
n2f(ng)=-1;
