function [X,Y] = triag_fill(w, h, w_N, h_N)
% TRIAG_FILL returns Xs in R^(3,2*x_N*y_N) and Ys in R^(3,2*x_N,y_N) that
% are points of triangles that fill the rectangle of width w and height h
% with w_N triangles across the width and h_N across the height.

    %% Semi products
    X_sem = repelem(0:w_N,3)'; % semi production vector X for creating X_l and X_u    
    Y_sem = repmat([0;1;1],w_N+1,1);
    
    %% X_l, Y_l for the lower triangles
    
    %TODO: is this faster? X_l = floor(linspace(1/3,w_N+1/3,3*w_N))*(w/w_N);
    X_l_1 = X_sem(2:end-2)*(w/w_N); % will be the same for all the rows of triags   
    X_l = repmat(X_l_1,1,h_N);
    
    Y_l_1 = Y_sem(1:end-3);
    Y_l = (repmat(Y_l_1,1,h_N) + (0:h_N-1))*(h/h_N);
    
    %% X_u, Y_u for the upper triangles
    X_u_1 = X_sem(3:end-1)*(w/w_N); % will be the same for all the rows of triags    
    X_u = repmat(X_u_1, 1, h_N);
    
    Y_u_1 = abs(Y_sem(2:end-2) - 1);
    Y_u = (repmat(Y_u_1, 1, h_N) + (0:h_N-1))*(h/h_N);
    
    %% Final shaping
    X = reshape([X_l, X_u], 3, 2*w_N*h_N)';
    Y = reshape([Y_l, Y_u], 3, 2*w_N*h_N)';
end

