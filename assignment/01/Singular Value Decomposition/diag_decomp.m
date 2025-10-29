function [Q,sigma,S] = diag_decomp(S,tol)
%DIAG_DECOMP decomposes the square matrix into a matrix of eigenvectors Q
%            and a vector of eigenvalues sigma so that S = Q*diag(sigma)*Q' using
%            the Jakobi eigenvalue algorithm.
[n1,n2] = size(S);
if n1 ~= n2
    error('A must be a square matrix');
else
    n = n1;
    % max_rotations = 5*(n^2); % TODO: this should be in the functions parameters
    Q = eye(n); % init the transformation matrix as identity
    while 1
        [Smax,k,l] = max_non_diag_elem(S,n);
         if abs(Smax) < tol
            sigma = diag(S);
            return
        end
        phi = (S(l,l) - S(k,k))/2*S(k,l);
        tan = phi - sqrt(phi^2 + 1);
        R = rotation_matrix(n,k,l,tan);
        S = R'*S*R;
        Q = Q*R;
    end
    sigma = diag(S);
end