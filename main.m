% Code for solving the Poisson equation in 1D using the finite element method
% PARAMETERS
% n - number of elements
% r - grid stretch factor
% x - node coordinates
% h - mesh spacing
% theta - local-to-global mapping
% n2f - boundary condition capture
% ud - vector giving inhomogeneous Dirichlet boundary values

n = 5;
[x,h,theta,n2f] = mesh1d(n,1.0);
% Set inhomogeneous Dirichlet here
ud = zeros(n+1,1);
% ud(1)=2
% ud(end)=0.5

% Assembly and solution
A = amat(n,h,theta,n2f);
F = rhs(n,x,h,theta,n2f,ud);
uh = A\F;

% Error calculation
u = exact(x(2:end-1));
e=uh-u;
z = A*e;
norm = sqrt(z'*e)

% Add boundaries and plot solution
uhout = [ ud(1) uh' ud(end)]';
plot(x,uhout,'k-o')
hold on
% Add more points to exact solution to demonstrate piecewise linear.
x=[0:0.01:1]';
u=exact(x);
plot(x,u,'k--')

