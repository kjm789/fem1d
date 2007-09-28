function u=exact(x)
% Evaluates the exact solution at given points

u = 0.5*x.*(ones(length(x),1)-x); % exact for -uxx=1
% u = -1/6*x.^3 - 1/2*x.^2 + 2/3*x; % exact for -uxx=x+1
% u = -1/12*x(2:end-1).^4 + 1/12*x(2:end-1); % exact for -uxx=x^2 (this is not solved exact? not exact quadrature...)
