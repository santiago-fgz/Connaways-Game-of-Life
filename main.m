%==========================================================================
% Connaway's Game Of Life
%
% Santiago F.G. Zamora
%==========================================================================

n = 100; % tamaño del grid
g = 100; % número de generaciones
t = 0.1; % tiempo de espera entre generaciones [s]

h = figure;

% valores iniciales aleatorios
grid = zeros(n);
for j = 1:n
    grid(j,:) = int32(randi([0, 1], [1, n]));
end

% loop
for k = 1:g
    imshow(grid, 'InitialMagnification', 'fit')
    grid = new_grid(grid,n);
    pause(t);
end