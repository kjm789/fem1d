function F = rhs(n,x,h,theta,n2f,udt)
% Calculates the load vector

F = zeros(n-1,1);
for k=1:n
  Fk = zeros(2,1);

  for alpha = 1:2
    Fk(alpha) = h(k)/2 * f(0.5 * (x(theta(k,1))+x(theta(k,2)))); % one-point Gauss quadrature
  end

  Ak = 1/h(k)*[1 -1;
	      -1  1];
  ud = [udt(theta(k,1));
        udt(theta(k,2))];
  Fk = Fk - Ak*ud;
  for alpha = 1:2
    i = n2f(theta(k,alpha));
    if i>0
      F(i) = F(i) + Fk(alpha);
    end
  end
end
  
