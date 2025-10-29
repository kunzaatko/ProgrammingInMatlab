%% %%%%%%% %
%  SETTING %
% %%%%%%%% %
hold on;
axis equal off;
shading interp;

% Setting
width = 3;
height = 2;
n_X = 150; % number of divisions on the x-axis per 1 unit
n_Y = 100; % number of divisions on the y-axis per 1 unit

A_sin_x = 0.3;
n_sin_x = 2;

A_sin_y = 0.4;
n_sin_y = 4;

normalizing_factor_x_displacement = @(X) (exp(X)-1)/exp(width);

% Regions
XV = [0, 3, 3, 0;    % background
      0, 1.5, 0, 0;  % triangle
      0, 1.5, 3, 3;  % lower poly
      0, 1.5, 3, 3]; % upper poly
YV = [0, 0, 2, 2;
      0, 1, 2, 2;
      0, 1, 1, 0;
      2, 1, 1, 2];
cols = [1/255, 49/255, 141/255;  % background (blue)
        1/255, 49/255, 141/255;     % blue
        204/255, 0/255, 0/255;      % red
        255/255, 255/255, 255/255]; % white

% triangle allocation
[X,Y] = triag_fill(width, height, n_X, n_Y);

COL = zeros(size(X,1), 3);

[X,Y,COL] = set_col(X,Y,XV,YV,COL,cols);

Z = A_sin_x*sin(n_sin_x*X) + A_sin_y*sin(n_sin_y*Y).*normalizing_factor_x_displacement(X);

unique_cols = unique(COL, 'rows');
% draw
for i=1:size(unique_cols, 1)
    col = unique_cols(i,:);
    where_col = all((COL == col)');
    fill3(X(where_col, :)', Y(where_col,:)', Z(where_col,:)', col, "EdgeColor", 'none');
end