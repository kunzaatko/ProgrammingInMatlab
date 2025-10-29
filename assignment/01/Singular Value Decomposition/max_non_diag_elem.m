function [Smax,k,l] = max_non_diag_elem(S,n)
%MAX_NON_DIAG_ELEM find the largest non-diagonal element of a square matrix
%                  S where the dimension is 2 and more
S_abs = abs(S) - max(abs(S(:)))*(eye(n));
[~,k] = max(S_abs(2:end,1));
k = k + 1;
l = 1;
Smax_abs = S_abs(k,1);
for l_temp=2:n
    [Smax_abs_temp,k_temp] = maxk(S_abs(:,l_temp),1);
    if Smax_abs < Smax_abs_temp
        Smax_abs = Smax_abs_temp;
        k = k_temp;
        l = l_temp;
    end
end
Smax = S(k,l);
end