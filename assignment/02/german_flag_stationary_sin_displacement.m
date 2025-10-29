%% %%%%%%% %
%  SETTING %
% %%%%%%%% %
hold on;
axis equal off;
shading interp;

% Setting
width = 9;
height = 6;
n_X = 180; % number of divisions on the x-axis per 1 unit
n_Y = 120; % number of divisions on the y-axis per 1 unit

A_sin_x = 0.3;
n_sin_x = 2;

A_sin_y = 0.4;
n_sin_y = 4;

normalizing_factor_x_displacement = @(X) (exp(X)-1)/exp(width);

% Regions
XV = [0, width, width, 0;  % triangle
      0, width, width, 0;  % lower poly
      0, width, width, 0]; % upper poly
YV = [0, 0, height/3, height/3;
      height/3, height/3, 2*height/3, 2*height/3;
      2*height/3, 2*height/3 , height, height];
cols = [255/255, 207/255, 0/255;     % yellow
        222/255, 0/255, 0/255;      % red
        0/255, 0/255, 0/255]; % black

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