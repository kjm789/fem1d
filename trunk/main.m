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
% Inhomogeneous Dirichlet
ud = zeros(n+1,1);
% ud(1)=2
% ud(end)=0.5


plot(x,ones(length(x)),'-o')

A = amat(n,h,theta,n2f);
F = rhs(n,x,h,theta,n2f,ud);
uh = A\F
u = -1/12*x(2:end-1).^4 + 1/12*x(2:end-1); % exact for -uxx=x^2 (this is not exact? not exact quadrature...)
e=uh-u;
z = A*e;
norm = sqrt(z'*e)

% Add boundaries
uhout = [ ud(1) uh' ud(end)]';
plot(x,uhout,'k-o')
hold on
%exact solution
x=[0:0.01:1]';
% u = 0.5*x.*(ones(length(x),1)-x); % exact for -uxx=1
% u = -1/6*x.^3 - 1/2*x.^2 + 2/3*x; % exact for -uxx=x+1
u = -1/12*x.^4 + 1/12*x; % exact for -uxx=x^2 (this is not exact? not exact quadrature...)
% u = -0.5*x.*(2*ones(length(x),1)+x) + 2*ones(length(x),1); % exact for -uxx=1, inhomogeneous dirichlet
plot(x,u,'k--')

