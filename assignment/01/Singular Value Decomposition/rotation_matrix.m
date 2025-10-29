function R = rotation_matrix(n,k,l,tan)
%ROTATION_MATRIX define the rotation matrix for indices k,l for angle
%                theta with dimension n
R = eye(n);
R(k,:) = 0;
R(l,:) = 0;
cos = 1/sqrt(1 + tan^2);
sin = tan*cos;
R(k,k) = cos;
R(k,l) = -sin;
R(l,k) = sin;
R(l,l) = cos;
end
