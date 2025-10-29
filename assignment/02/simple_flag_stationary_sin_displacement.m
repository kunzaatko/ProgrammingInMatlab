%% %%%%%%% %
%  SETTING %
% %%%%%%%% %
hold on
axis equal off
shading interp

% Setting
width = 3;
height = 2;
n_X = 60; % number of divisions on the x-axis per 1 unit
n_Y = 40; % number of divisions on the y-axis per 1 unit
col = [204/255, 0/255, 0/255];

A_sin_x = 0.3;
n_sin_x = 2;

A_sin_y = 0.4;
n_sin_y = 4;

normalizing_factor_x_displacement = @(X) (exp(X)-1)/exp(width);

% The flag will be made of triangles.

% background
[X,Y] = triag_fill(width, height, n_X, n_Y);

Z = A_sin_x*sin(n_sin_x*X) + A_sin_y*sin(n_sin_y*Y).*normalizing_factor_x_displacement(X);

for i=1:size(X,1)
    fill3(X(i,:), Y(i,:), Z(i, :), col, 'EdgeColor', 'none');
end
