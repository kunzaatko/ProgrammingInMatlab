%% %%%%%%% %
%  SETTING %
% %%%%%%%% %
hold on
axis equal off

% Setting
width = 3;
height = 2;
n_X = 60; % number of divisions on the x-axis per 1 unit
n_Y = 40; % number of divisions on the y-axis per 1 unit
col = [204/255, 0/255, 0/255];

% The flag will be made of triangles.

% background
[X,Y] = triag_fill(width, height, n_X, n_Y);

Z = 0*X;

for i=1:length(X)
    fill3(X(i,:), Y(i,:), Z(i, :), col, 'EdgeColor', 'none');
end
