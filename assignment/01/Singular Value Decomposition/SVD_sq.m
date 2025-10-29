function [U,E,V] = SVD_sq(A,tol)
%SVD Single Value Decomposition
%      Decomposes a square matrix into U,V orthogonal matrices and E a
%      diagonal so that A = U*diag(E)*V'

[V,Esq,~] = diag_decomp(A'*A, tol);
[U,~,~] = diag_decomp(A*A',tol);
E = sqrt(Esq);
end

