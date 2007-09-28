function A = amat(n,h,theta,n2f)
% Assembles the A matrix

A = spalloc(n-1,n-1,3*n); % Generate sparse matrix to save storage
for k = 1:n
  Ak = 1/h(k)*[1 -1;
	      -1  1];
  for alpha = 1:2
    i=n2f(theta(k,alpha));
    if i>0
      for beta = 1:2
	j = n2f(theta(k,beta));
	if j>0
	  A(i,j) = A(i,j) + Ak(alpha,beta);
	end
      end
    end
  end
end
